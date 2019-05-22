function out = pressuremarsstatic (in)
    out = 10.1879*exp(-(3.8/(188.92*150))*(in-40));
end