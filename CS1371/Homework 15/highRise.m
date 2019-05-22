function [] = highRise (dimension)

    hold on
    [long,~] = size(dimension);
    offset = 0;
    for i = 1:long
        [x,y] = makePlotPoints(dimension(i,:),offset);
        switch mod(i,2)
            case 1
                plot(x,y,'b');
            case 0
                plot(x,y,'k');
        end
        offset = offset+dimension(i,2)+1;
    end
    hold off
end

function [x,y] = makePlotPoints (dimension,offset)

    height = dimension(1);
    width = dimension(2);
    x = [0 0 width width 0]+offset;
    y = [0 height height 0 0];

end