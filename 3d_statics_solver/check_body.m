function [isbody,body_name] = check_body(str)
isbody = false;
body_name = '';
if strcmp(str(1:4),'body')
  isbody = true; 
  str(1:4) = [];
  str = remove_end_space(str);
  body_name = str; 
end
end