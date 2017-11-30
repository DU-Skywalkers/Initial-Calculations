close all
clear all
clc

% Lift equation: L = CL * ((rho * V^2) /2) * PA;
L = 366.9783;% Desired lift (lbs), 1.5*loaded plane weight(55lbs)
W = 25; %mass in Kg
%CL = 1.452; % coefficient of lift
rho = 1.225; % Density of air in kg/m^3
g = 9.81;
V = 12; % desired take off velocity in/s
% PA is planform area in square inches of the wing
PA = 1.6526531463;
CL = 1.8;
PA1 = (2*L);
PA2 = (rho*(V^2)*CL);
PA = PA1/PA2*1550

Lm = 8.75;
L1 = 38.825;
L2 = 28.8;

syms X

Am = Lm*X;
A1 = .8*X*L1;
A2 = (.2*X*L1)/2;
A3 = .5*X*L2;
A4 = (.3*X*L2)/2;

A = PA;

equ = A == ((A1+A2+A3+A4)*2)-Am;

solu = solve(equ,X);

chord = round(double(solu),2)

Am = A/1550;

CLmax = 1.8;
Vstall = sqrt((2*W*g*Am*CLmax)/rho)
Vt = Vstall*1.2;
