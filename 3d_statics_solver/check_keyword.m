function mode = check_keyword (str)
mode = 0; 
if strcmp(str,'known forces')
  mode = 1;
elseif strcmp(str,'known moments')
  mode = 2; 
elseif strcmp (str,'unknown forces')
  mode = 3;
elseif strcmp (str,'unknown moments')
  mode = 4; 
end
end