function labelparameter (n,k,m,gamma,f,A,tf,tnow,iter,step,fh,w)
    mgf = 0.95;
    leftmar = -3*w*mgf;
    text(leftmar,fh*1,sprintf('forcing amplitude A: %f',A));
    text(leftmar,fh*2,sprintf('forcing frequency f: %f',f));
    text(leftmar,fh*3,sprintf('mass of a floor m: %f',m));
    text(leftmar,fh*4,sprintf('damping factor gamma: %f',gamma));
    text(leftmar,fh*5,sprintf('spring constant k: %f',k));
    text(leftmar,fh*6,sprintf('total levels n: %d',n));
    text(leftmar,fh*7,sprintf('total t steps: %d',iter));
    text(leftmar,fh*8,sprintf('current t step: %d',step));
    text(leftmar,fh*9,sprintf('total simulation time tf: %f',tf));
    text(leftmar,fh*10,sprintf('current simulation time: %f',tnow));
end