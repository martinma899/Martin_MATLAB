function out = pressuremars(alt)
    out = 7.5e2*((-2*alt+230)/230).^(-3.8/(-2*10^-3*188.92));
end