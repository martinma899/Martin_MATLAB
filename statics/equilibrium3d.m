function [output] = equilibrium3d(filename)

    fid = fopen(filename); % open file
    
    varnamearr = []; % initialize arrays

    line = fgetl(fid); % skip over first line -- useless title
    line = fgetl(fid); % read first line, initialize loop
    lefthandside = [];
    righthandside = zeros(6,1);
    varnamearr = [];
    
    while ischar(line) % iterate through every single line
        % find name of unknown or scaling factor of known
        [name,line] = strtok(line,' '); 
        % find location and direction as string
        % neither should be assumed as normalized
        [location,direction] = strtok(line,';');
        % cast the location vector into double vector
        location = str2num(location);
        direction = str2num(direction(2:end));
        % normalize directional vector
        direction = direction/norm(direction);
        % try to convert name into double to see if it is a number
        varnumtest = str2num(name);
        if isempty(varnumtest)% if the name is an unknown
            % add the appropriate column to the left hand side
            lefthandside = [lefthandside ...
                           [direction';cross(location,direction)']];
            % save this variable name
            varnamearr = [varnamearr;{name}];
        else% if the name is a number, a known quantity
            % add the appropriate quantity to the right hand side
            righthandside = righthandside-[varnumtest*direction'; ...
                varnumtest*cross(location,direction)'];
        end
        % get new line
        line = fgetl(fid);
    end
    fclose(fid); % close file
    % solve system of equation
    reducedmat = rref([lefthandside righthandside]);
    output = [varnamearr num2cell(reducedmat(1:length(varnamearr),end))];
end
















