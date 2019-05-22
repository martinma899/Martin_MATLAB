hold on
eigenvalues = linspace(-7,7,700);
plot(eigenvalues,0*eigenvalues,'r-');
while true
mat = rand(2,2);
s = size(mat,1);
eigenvalues = linspace(-7,7,1000);
outdeterminants = [];
for a = eigenvalues
    outdeterminants = [outdeterminants det(mat-a*eye(s))];
end
[minvalue,index] = min(outdeterminants);
minx = eigenvalues(index);
%plot(eigenvalues,outdeterminants,'b-');
%hold on
%plot(eigenvalues,0*eigenvalues,'r-');
%hold off
plot(minx,minvalue,'b.')
axis([-1 1 -1 1])
pause(0.1)
end