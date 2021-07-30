clc;clear;close all

x = 1:10;
y = x.^2;

fo = figure;
plot(x,y);
axo = gca;
axo.YScale = 'log'