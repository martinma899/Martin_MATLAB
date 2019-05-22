function [isDenied] = fieldGoalDenied(fieldGoal, patrick)
%% Calc position and acceleration from velocity vec

    time = fieldGoal(2,:);
    velocity = fieldGoal(1,:);
    
    acceltime = time(1:end-1);
    accel = diff(velocity)./diff(time);
    
    pos = cumsum(velocity(1:end-1)).*diff(time);

%% Using patrick's pos to find whether he blocks or not.

    timestamp = patrick(2);
    actualpos = patrick(1);
    coeffs = polyfit(acceltime,pos,7);
    ballpos = polyval(coeffs,timestamp);
    isDenied = (actualpos>=ballpos);

%% Plot

    figure(2);
    box on
    subplot(1,3,1)
        plot(time,velocity,'k'),xlabel('Time'),ylabel('Velocity')
    subplot(1,3,2)
        plot(acceltime,accel,'b');xlabel('Time'),ylabel('Acceleration')
    ax = subplot(1,3,3);
        hold on
        plot(timestamp,actualpos,'g+');
        plot(timestamp,ballpos,'ro');
        plot(acceltime,pos,'m'),xlabel('Time'),ylabel('Position')
        hold off
        box(ax,'off')


end