function renderSTL (fv)
  % The model is rendered with a PATCH graphics object. We also add some dynamic
  % lighting, and adjust the material properties to change the specular
  % highlighting.
  patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
           'EdgeColor',       'none',        ...
           'FaceLighting',    'gouraud',     ...
           'AmbientStrength', 0.15);

  % Add a camera light, and tone down the specular highlighting
  light('Position',[0 0 -50],'Style','local')
  material('dull');
end