clc;clear

alpha_w_list = [2;3.2;4.6;5.8;7.3];
i_t_list = [1;0;-1;-2;-3];
i_w = 1;
A = [alpha_w_list-i_w ones(5,1)];
b = alpha_w_list-i_w+i_t_list;

sol = (A'*A)^-1*A'*b

plot(alpha_w_list-i_w, alpha_w_list-i_w+i_t_list,'ks')
grid on
