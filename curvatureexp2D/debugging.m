clc;clear

A = [0.8 -0.015]';
B = [0.9 -0.0082]';
C = [0.95 -0.0048]';

AB = B-A
BC = C-B

ABslope = AB(2)/AB(1)
BCslope = BC(2)/BC(1)