clc;clear

% 3d statics solver
% uses the input file
% specify known forces and moments
% specify direction of all unknown forces and moments
% solver either solves for the forces or tells you system has no solution
% or is indeterminant

% input file string table design
% body_name type            string
% body1     known forces    Rx   0     0     0     l*cosd(alpha) l*sind(alpha) 0
% body2     known moments   M1   0     0     5
% ...       ...             ...

% body indexing array
% index string
%  1    {'body1'}
%  2    {'body2'}
% ...   ...
body_array = {};
current_body_index = nan; 

mode = 0; 

% known force format
% body_index name x_loc y_loc z_loc x_comp y_comp z_comp scale
%  1         'Rx' 0     10    0     1      0      0      1
%  2         'Rx' 0     10    0     -1     0      0      1
%  1         'Ry' 0     10    0     0      1      0      1
known_forces = make_row_known_force([],{},[],[],[],[],[],[],[]);

% known moment format
% body_index name x_comp y_comp z_comp scale
%  1         M2   0      0      -1     1
known_moments = make_row_known_moment([],{},[],[],[],[]);

% unknown force format
% body_index name x_loc y_loc z_loc x_dir y_dir z_dir scale
%  1         Fx   rx    ry    0     1     1     0     1
unknown_forces = make_row_unknown_force([],{},[],[],[],[],[],[],[]);

% unknown moment format
% body_index name x_dir y_dir z_dir scale
%  1         M    0     0     1     2
unknown_moments = make_row_unknown_moment([],{},[],[],[],[]);

% for each known force on a body, their x y z components are: 
% [Fxi]   [x_comp]   
% [Fyi] = [y_comp] X force scale
% [Fzi]   [z_comp]   

% for each known moment on a body, their x y z components are: 
% [Mxi]   [x_comp]   
% [Myi] = [y_comp] X moment scale
% [Mzi]   [z_comp]   

% for each known force on a body, their moments about origin are: 
% [FMxi]   [x_dir]   [x_comp]
% [FMyi] = [y_dir] X [y_comp] X force scale
% [FMzi]   [z_dir]   [z_comp]

% for each unknown force on a body, its force eqn x y z coefficients are: 
% [cfxi]   [x_dir]   |x_dir|
% [cfyi] = [y_dir] / |y_dir| X unknown force scale
% [cfzi]   [z_dir]   |z_dir|

% when multiple instances of the same unknown forces appears on the body,
% its force eqn x y z coefficients are: 
% [cfxi]    n  [ [x_dir_k]   |x_dir_k|                         ]
% [cfyi] = SUM | [y_dir_k] / |y_dir_k| X unknown force scale_k |
% [cfzi]   k=1 [ [z_dir_k]   |z_dir_k|                         ]

% for each unknown force on a body, its moment eqn x y z coefficients are: 
% [cfmxi]   [x_loc]   [x_dir]   |x_dir|
% [cfmyi] = [y_loc] X [y_dir] / |y_dir| X unknown force scale
% [cfmzi]   [z_loc]   [z_dir]   |z_dir|

% when multiple instances of the same unknown forces appear on the body, 
% its force eqn x y z coefficients are: 
% [cfmxi]    n  [ [x_loc_k]   [x_dir_k]   |x_dir_k|                         ]
% [cfmyi] = SUM | [y_loc_k] X [y_dir_k] / |y_dir_k| X unknown force scale_k |
% [cfmzi]   k=1 [ [z_loc_k]   [z_dir_k]   |z_dir_k|                         ]


% for each unknown moment on a body, its x y z coefficient are: 
% [cmxi]   [x_dir]   |x_dir|
% [cmyi] = [y_dir] / |y_dir| X unknown moment scale
% [cmzi]   [z_dir}   |z_dir|

% what the system looks like for one body: 
%               unknown unknown ... unknown unknown ...   RHS
%               force 1 force 2 ... momnt 1 momnt 2 ... 
% x force eqn [ cfx1    cfx2    ... 0       0       ... | -(Fx1 + Fx2 + ...)                     ]
% y force eqn [ cfy1    cfy2    ... 0       0       ... | -(Fy1 + Fy2 + ...)                     ]
% z force eqn [ cfz1    cfz2    ... 0       0       ... | -(Fz1 + Fz2 + ...)                     ]
% x momnt eqn [ cfmx1   cfmx2   ... cmx1    cmx2    ... | -(Mx1 + Mx2 + ... + FMx1 + FMx2 + ...) ]
% y momnt eqn [ cfmy1   cfmy2   ... cmy1    cmy2    ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]
% z momnt eqn [ cfmz1   cfmz2   ... cmz1    cmz2    ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]

% what the system looks like for multiple bodies: 
%                 unknown unknown unknown ... unknown unknown unknown ...   RHS
%                 force 1 force 2 force 3 ... momnt 1 momnt 2 momnt 2 ... 
%   x force eqn [ cfx1    cfx2    0       ... 0       0       0       ... | -(Fx1 + Fx2 + ...)                     ]
% B y force eqn [ cfy1    cfy2    0       ... 0       0       0       ... | -(Fy1 + Fy2 + ...)                     ]
% O z force eqn [ cfz1    cfz2    0       ... 0       0       0       ... | -(Fz1 + Fz2 + ...)                     ]
% D x momnt eqn [ cfmx1   cfmx2   0       ... cmx1    cmx2    0       ... | -(Mx1 + Mx2 + ... + FMx1 + FMx2 + ...) ]
% Y y momnt eqn [ cfmy1   cfmy2   0       ... cmy1    cmy2    0       ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]
% 1 z momnt eqn [ cfmz1   cfmz2   0       ... cmz1    cmz2    0       ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]

%   x force eqn [ 0       cfx2    cfx3    ... 0       0       0       ... | -(Fx1 + Fx2 + ...)                     ]
% B y force eqn [ 0       cfy2    cfy3    ... 0       0       0       ... | -(Fy1 + Fy2 + ...)                     ]
% O z force eqn [ 0       cfz2    cfz3    ... 0       0       0       ... | -(Fz1 + Fz2 + ...)                     ]
% D x momnt eqn [ 0       cfmx2   cfmx3   ... 0       cmx2    cmx3    ... | -(Mx1 + Mx2 + ... + FMx1 + FMx2 + ...) ]
% Y y momnt eqn [ 0       cfmy2   cfmx3   ... 0       cmy2    cmy3    ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]
% 2 z momnt eqn [ 0       cfmz2   cfmx3   ... 0       cmz2    cmz3    ... | -(My1 + My2 + ... + FMy1 + FMy2 + ...) ]
%                           ^                           ^
%                           |                           |
%                         same unknowns on multiple bodies

% handling same unknown force / moment applied at different locations of the body: 
% combine matrix columns for that force in the same system by adding columns

% handling same unknown force / moment applied on different bodies: 
% put the coefficients of the same knowns in the same column during
% combination of multiple systems. 

% current mode identifiers
% null = 0
% known forces = 1
% known moments = 2
% unknown forces = 3
% uknonwn moments = 4

input_fname = 'crescendo_robot_hang_final_pos.txt'; 
plot_force_scale = 10/100;
plot_head_size = 1;

% begin file parsing
fid = fopen(input_fname); % open file
while true
  line = fgetl(fid); % get line
  if ~ischar(line); break; end % end of file
  line = remove_comment(line); % remove comments
  line = remove_end_space(line); % remove space in the end
  if isempty(line); continue; end % if line is empty now then skip
  
  % check for body declaration
  [isbody,body_name] = check_body(line); 
  if isbody % if this line is a body declaration
    if isempty(body_array) % first body
      body_array = [body_array;{body_name}];
      current_body_index = 1; 
    else
      tmp_unknown_force_moment_names = find(strcmp(body_array,body_name),1);
      if isempty(tmp_unknown_force_moment_names) % new body
        body_array = [body_array;{body_name}];
        current_body_index = numel(body_array); 
      else % existing body
        current_body_index = tmp_unknown_force_moment_names; 
      end
    end
    continue;
  end
  
  % check for mode change
  keyword_type = check_keyword(line); % check if line is a keyword
  if keyword_type ~= 0
    mode = keyword_type; 
    continue; 
  end
  
  % check for variable declaration
  if numel(line)>=3
    if strcmp(line(1:3),'var')
      [varname,varvalue] = strtok(line(4:end));
      tmps = sprintf('%s=%s;',varname,varvalue);
      eval(tmps);
    end
  end
  
  % parse line
  entries = split2(line,' ');
  switch mode
    case 1 % known forces
      kf_name = entries(1);
      kf_x_loc = eval(entries{2});
      kf_y_loc = eval(entries{3});
      kf_z_loc = eval(entries{4});
      kf_x_comp = eval(entries{5});
      kf_y_comp = eval(entries{6});
      kf_z_comp = eval(entries{7});
      kf_scale = eval(entries{8});
      kf_row = make_row_known_force(current_body_index,kf_name,...
        kf_x_loc,kf_y_loc,kf_z_loc,kf_x_comp,kf_y_comp,kf_z_comp,kf_scale);
      known_forces = vertcat(known_forces,kf_row);
    case 2 % known moments
      km_name = entries(1);
      km_x_comp = eval(entries{2});
      km_y_comp = eval(entries{3});
      km_z_comp = eval(entries{4});
      km_scale = eval(entries{5});
      km_row = make_row_known_moment(current_body_index,km_name,km_x_comp,...
        km_y_comp,km_z_comp,km_scale);
      known_moments = vertcat(known_moments,km_row);
    case 3 % unknown forces
      uf_name = entries(1); 
      uf_x_loc = eval(entries{2});
      uf_y_loc = eval(entries{3});
      uf_z_loc = eval(entries{4});
      uf_x_dir = eval(entries{5});
      uf_y_dir = eval(entries{6});
      uf_z_dir = eval(entries{7});
      uf_scale = eval(entries{8});
      uf_row = make_row_unknown_force(current_body_index,uf_name,...
        uf_x_loc,uf_y_loc,uf_z_loc,uf_x_dir,uf_y_dir,uf_z_dir,uf_scale);
      unknown_forces = vertcat(unknown_forces,uf_row);
    case 4 % unknown moments
      um_name = entries(1); 
      um_x_dir = eval(entries{2});
      um_y_dir = eval(entries{3});
      um_z_dir = eval(entries{4});
      um_scale = eval(entries{5});
      um_row = make_row_unknown_moment(current_body_index,um_name,um_x_dir,...
        um_y_dir,um_z_dir,um_scale);
      unknown_moments = vertcat(unknown_moments,um_row);
  end

  
end

% end of file reading

% print known and unknown tables
fprintf('<strong>raw inputs</strong>: \n')
fprintf('\n<strong>known forces</strong>: \n')
disp(known_forces)

fprintf('\n<strong>known moments</strong>: \n')
disp(known_moments)

fprintf('\n<strong>unknown forces</strong>: \n')
disp(unknown_forces)

fprintf('\n<strong>unknown moments</strong>: \n')
disp(unknown_moments)

% assign unique indexes to unknown forces and moments
[u_unknown_forces,u_unknown_forces_index_a,u_unknown_forces_index] = unique(unknown_forces.name);
[u_unknown_moments,u_unknown_moments_index_a,u_unknown_moments_index] = unique(unknown_moments.name);

fprintf('\n<strong>list of unknowns</strong>:\n')
fprintf('<strong>Column  Name</strong>\n')
fprintf('<strong>______  ____</strong>\n')
tmp_unknown_force_moment_names = [u_unknown_forces;u_unknown_moments];
for i = 1:numel(tmp_unknown_force_moment_names)
  fprintf('%6d  %s\n',i,tmp_unknown_force_moment_names{i})
end

nf = numel(u_unknown_forces);
nm = numel(u_unknown_moments);
nb = numel(body_array);

% construct 3d array
% index 1: 1 to 6, fx fy fz mx my mz equations
% index 2: 1 to n(unknown_forces)+n(unknown_moments)+1, columns
% index 3: 1 to number of bodies. body index

mat3D = zeros(6,1+nf+nm,nb);

% fill in unknown force coeffs
nuf = height(unknown_forces);
if nuf~=0
for i = 1:nuf
  vec = [unknown_forces.x_dir(i); unknown_forces.y_dir(i); unknown_forces.z_dir(i)]; % extract directional vector
  vec_mag = norm(vec); % magnitude of directional vector
  vecn = vec/vec_mag; % normalized directional vector
  loc = [unknown_forces.x_loc(i); unknown_forces.y_loc(i); unknown_forces.z_loc(i)]; % location vector
  uf_ind = u_unknown_forces_index(i); % get force index
  cfxyzi = vecn*unknown_forces.scale(i); % force coefficent in x y z vector form multiply by scale factor
  mat3D(1:3,uf_ind,unknown_forces.body_index(i)) = ...
    mat3D(1:3,uf_ind,unknown_forces.body_index(i))+cfxyzi; % add force coefficients into matrix
  cfmxyzi = cross(loc,cfxyzi); % compute force induced moment coefficient
  mat3D(4:6,uf_ind,unknown_forces.body_index(i)) = ...
    mat3D(4:6,uf_ind,unknown_forces.body_index(i))+cfmxyzi; % add into matrix
end
end

% fill in unknown moment coeffs
num = height(unknown_moments); 
if num~=0
  for i = 1:num
    vec = [unknown_moments.x_dir(i); unknown_moments.y_dir(i); unknown_moments.z_dir(i)]; % extract directional vector
    vec_mag = norm(vec); % magnitude of directional vector
    vecn = vec/vec_mag; % normalized directional vector
    um_ind = u_unknown_moments_index(i); % get moment index
    cmxyzi = vecn*unknown_moments.scale(i); % compute moment coefficients in vector form
    mat3D(4:6,nf+um_ind,unknown_moments.body_index(i)) = ...
      mat3D(4:6,nf+um_ind,unknown_moments.body_index(i))+cmxyzi; % add into matrix
  end
end

% fill in known forces
nkf = height(known_forces);
if nkf~=0
  for i = 1:nkf
    fvec = [known_forces.x_comp(i);known_forces.y_comp(i);known_forces.z_comp(i)]; % force vector
    fvec = fvec*known_forces.scale(i); % multiply force vector with scale
    mat3D(1:3,end,known_forces.body_index(i)) = ...
      mat3D(1:3,end,known_forces.body_index(i))-fvec;
    loc = [known_forces.x_loc(i); known_forces.y_loc(i); known_forces.z_loc(i)]; % location vector
    fmvec = cross(loc,fvec);
    mat3D(4:6,end,known_forces.body_index(i)) = ...
      mat3D(4:6,end,known_forces.body_index(i))-fmvec;
  end
end

% fill in known moments
nkm = height(known_moments);
if nkm~=0
  for i = 1:nkm
    mvec = [known_moments.x_comp(i);known_moments.y_comp(i);known_moments.z_comp(i)]*known_moments.scale(i);
    mat3D(4:6,end,known_moments.body_index(i)) = ...
      mat3D(4:6,end,known_moments.body_index(i))-mvec;
  end
end

% reshape the matrix 
mat2D = zeros(6*nb,size(mat3D,2));
for i = 1:nb
  mat2D((1:6)+(i-1)*6,:) = mat3D(:,:,i);
end

fprintf('\n<strong>Augmented System</strong>:\n')
disp(mat2D);

matRREF = rref(mat2D); % solve

fprintf('\n<strong>Reduced Augmented System</strong>:\n')
disp(matRREF);

sol_state = check_RREF_sol_state(matRREF);
fprintf('\n<strong> solution uniqueness: </strong>')
if sol_state == 0
  fprintf('system has no solution\n')
elseif sol_state == 1
  fprintf('system has a unique solution\n')
  unique_sol = true; 
elseif sol_state == 2
  fprintf('system has infinitely many solutions\n')
end

if unique_sol
  fprintf('\n<strong>Solution: </strong>\n')
  fprintf('<strong>Name      Value</strong>\n')
  fprintf('<strong>________  _________</strong>\n')
  for i = 1:numel(tmp_unknown_force_moment_names)
    fprintf('%8s  %8f\n',tmp_unknown_force_moment_names{i},matRREF(i,end));
  end
  
  % put solution back into unknown force table
  if nuf>0
%     unuf = numel(u_unknown_forces_index_a); % unique unknown forces count
    unknown_force_sol = matRREF(1:nuf,end); % extract force solution
    unknown_forces = addvars(unknown_forces,zeros(height(unknown_forces),1),'NewVariableNames',{'solution'});
    for i = 1:nuf
      unknown_forces.solution(i) = unknown_force_sol(u_unknown_forces_index(i));
    end
  end
  
  % plot known forces
  % generate colors for bodies
  R_threshold = [0.3 0.9];
  G_threshold = [0.3 0.9];
  B_threshold = [0.3 0.9];
  
  R_vec = rand([nb,1])*diff(R_threshold)+R_threshold(1);
  G_vec = rand([nb,1])*diff(G_threshold)+G_threshold(1);
  B_vec = rand([nb,1])*diff(B_threshold)+B_threshold(1);
  
  color_array = [R_vec G_vec B_vec];
  
  close all;
  figure(1); hold on; axis equal; grid on;
  axis_obj = gca;
  
  % plot all known forces
  
  for i = 1:nkf
    plot_arrow(axis_obj,...
      known_forces.x_loc(i),...
      known_forces.y_loc(i),...
      known_forces.z_loc(i),...
      known_forces.x_comp(i)*known_forces.scale(i),...
      known_forces.y_comp(i)*known_forces.scale(i),...
      known_forces.z_comp(i)*known_forces.scale(i),...
      known_forces.name{i},...
      plot_force_scale,...
      color_array(known_forces.body_index(i),:),...
      color_array(known_forces.body_index(i),:),...
      plot_head_size,20);
  end
  
  % plot all unknown forces
  for i = 1:nuf
    vec = [unknown_forces.x_dir(i); unknown_forces.y_dir(i); unknown_forces.z_dir(i)]; % extract directional vector
    vec_mag = norm(vec); % magnitude of directional vector
    vecn = vec/vec_mag; % normalized directional vector
    plot_arrow(axis_obj,...
      unknown_forces.x_loc(i),...
      unknown_forces.y_loc(i),...
      unknown_forces.z_loc(i),...
      vecn(1)*unknown_forces.solution(i)*unknown_forces.scale(i),...
      vecn(2)*unknown_forces.solution(i)*unknown_forces.scale(i),...
      vecn(3)*unknown_forces.solution(i)*unknown_forces.scale(i),...
      unknown_forces.name{i},...
      plot_force_scale,...
      color_array(unknown_forces.body_index(i),:),...
      color_array(unknown_forces.body_index(i),:),...
      plot_head_size,20);
  end
  
end



