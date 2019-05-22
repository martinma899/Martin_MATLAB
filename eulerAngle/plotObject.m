function plotObject(arr,clearBool)
  if clearBool
    clf
  end
  hold on
  plot3(arr(1,1:8),arr(2,1:8),arr(3,1:8),'ks-');
  plot3(arr(1,9:end-2),arr(2,9:end-2),arr(3,9:end-2),'rs-');
  plot3(arr(1,end-1:end),arr(2,end-1:end),arr(3,end-1:end),'gs-');
  axis([-2 2 -2 2 -2 2])
  axis square
  xlabel('x axis')
  ylabel('y axis')
  zlabel('z axis')
  view(3)
end