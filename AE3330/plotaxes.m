function plotaxes (l)
zerovec = [0 0 0]';
eyemat = eye(3)*l;
quiver3(zerovec,zerovec,zerovec,...
  eyemat(1,:)',eyemat(2,:)',eyemat(3,:)',0,'k')
text(l,0,0,'x = J2000')
text(0,l,0,'y')
text(0,0,l,'z')
end