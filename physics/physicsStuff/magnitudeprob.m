function [] = magnitudeprob (iterations)

    x = 1:iterations;

    for i = 1:iterations
        vec(i) = magnitude(rand(1,10));
    end
    
    [vec,index] = sort(vec);
    
    figure (1)
    hold on
    %plot(vec,x,'b.');
    plot(vec(1:end-1),diff(x),'r.');
    hold off
    
end