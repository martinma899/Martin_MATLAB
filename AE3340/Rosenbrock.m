function out = Rosenbrock(in)
% takes in 2xn array, returns 1xn array
out = 100*(in(2,:)-in(1,:).^2).^2+(1-in(1,:)).^2;
end