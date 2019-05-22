function theta = thetaAngle(M,r,beta)

  theta = atand(2*cotd(beta)...
    *(M^2*sind(beta)^2-1)/(M^2*(r+cosd(2*beta))+2));

end