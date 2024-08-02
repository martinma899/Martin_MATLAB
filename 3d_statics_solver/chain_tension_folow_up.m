
% gear radius
gear_radius = 2.38842/12; % ft

% get arm motor torque in ft lb
arm_motor_torque = matRREF(find(strcmp('M-ARM',tmp_unknown_force_moment_names),1),end)

% chain tension
chain_tension = arm_motor_torque/gear_radius