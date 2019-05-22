function [out1,out2] = r2c (in1,in2)

    out1 = in1*cosd(in2);
    out2 = in1*sind(in2);

end