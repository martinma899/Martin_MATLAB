function [out1,out2] = c2r (in1,in2)

    out1 = sqrt(in1^2+in2^2);
    out2 = atand(in2/in1);
    
end