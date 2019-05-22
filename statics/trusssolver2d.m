function [output] = trusssolver2d (filename)

    fid = fopen(filename); % open file
    
    varnamearr = []; % initialize arrays
    righthandside = [0;0];
    lefthandside = [];
    jointnames = [];
    
    line = fgetl(fid); % skip over first line -- useless title
    line = fgetl(fid); % read first line, initialize loop
    
    tempxyeqnarray = [];
    while ~strcmp(line,'Moment Equation') % while we do not hit the line 'Moment Equation'
        % process information in that line
        [varname,rest] = strtok(line,' ');
        [part1,part2] = strtok(rest,' ');
        if isempty(part2) % if a single entry of angle
            dir(1) = cosd(str2num(part1));
            dir(2) = sind(str2num(part1));
        else % if two entries of directional vector
            dir(1) = str2num(part1);
            dir(2) = str2num(part2);
            dir = dir/norm(dir); 
        end
        varnumtest = str2num(varname);
        if isempty(varnumtest) % if the variable name entry is not a value
            % archive for further processing
            tempxyeqnarray = [tempxyeqnarray;{varname} {dir(1)} {dir(2)}];
        else % if the variable name entry is a value
            % throw it to the right hand side
            righthandside = righthandside-varnumtest*dir';
        end
        line = fgetl(fid);
    end
    
    % format the information into varnamearr and lefthandside
    varnamearr = [varnamearr;tempxyeqnarray(:,1)];
    lefthandside = cell2mat(tempxyeqnarray(:,2:3))';
    
    % add a row for moment equations
    lefthandside = [lefthandside;zeros(1,length(varnamearr))];
    righthandside = [righthandside;0];
    
    % read moment equation
    line = fgetl(fid);
    % generate test compare string
    if length(line)<=5
        testcmp = line;
    else
        testcmp = line(1:5);
    end
    while ischar(line)&&~strcmp(testcmp,'Joint') % while we do not reach joints
        [varname,factor] = strtok(line,' ');
        factor = str2num(factor);
        varnumtest = str2num(varname);
        if isempty(varnumtest)
            lefthandside(3,strcmp(varnamearr,varname)') = factor;
        else
            righthandside(3) = righthandside(3)-varnumtest*factor;
        end
        line = fgetl(fid);
        % generate test compare string
        if length(line)<=5
            testcmp = line;
        else
            testcmp = line(1:5);
        end
    end
    
    % keep track of where we start flipping signs
    trussforcesstart = length(varnamearr)+1;
    
    while ischar(line) % big iteration that keeps reading joints
        % extract and store name of the joint
        [~,jointname] = strtok(line,' ');
        jointnames = [jointnames;{jointname(2:end)}];
        % add two lines to the equations
        lefthandside(end+2,1) = 0;
        righthandside(end+2) = 0;
        % move on to next line
        line = fgetl(fid); 
        % generate test compare string
        if length(line)<=5
            testcmp = line;
        else
            testcmp = line(1:5);
        end
        while ischar(line)&&~strcmp(testcmp,'Joint') % read each joint
            % process information in that line
            [varname,rest] = strtok(line,' ');
            [part1,part2] = strtok(rest,' ');
            if isempty(part2) % if a single entry of angle
                dir(1) = cosd(str2num(part1));
                dir(2) = sind(str2num(part1));
            else % if two entries of directional vector
                dir(1) = str2num(part1);
                dir(2) = str2num(part2);
                dir = dir/norm(dir); 
            end
            % try to convert varname to a number
            varnumtest = str2num(varname);
            % if the variable name entry is not a value
            if isempty(varnumtest) 
                % look for the varname's position in varnamearr
                varpos = strcmp(varnamearr,varname);
                if any(varpos) % if it's an archived variable
                    % put its factors in equation
                    lefthandside(end-1:end,varpos) = dir';
                else % if it's not an archived variable
                    % archive it
                    varnamearr = [varnamearr;{varname}];
                    % put its factors in a new column, expand left hand
                    % side
                    lefthandside(end-1:end,end+1) = dir';
                end 
            else % if the variable name entry is a value
                % throw it to the right hand side
                righthandside(end-1:end) = righthandside(end-1:end)...
                                            -varnumtest*dir';
            end
            line = fgetl(fid); % update to next line
            % generate test compare string
            if length(line)<=5
                testcmp = line;
            else
                testcmp = line(1:5);
            end
        end
    end
    solnset = rref([lefthandside righthandside]);
    solnset = solnset(1:length(varnamearr),end);
    output = [varnamearr num2cell(solnset)];
    fclose(fid);% close file
end