clear all
close all
clc
%% Weight -> Lift -> Drag -> Thrust
weight = 55;%weight lbs

%% Lift

% Lift = (1/2) d v^2 A CL  since lift must equal plane weight, assumed to
% be 55 pounds = 244.652N the necessary V is determined, from a standard CL being
% used.
length = 8;% length of total wingspan in ft
width = 1.5;%width in ft

w = weight*0.453592;%pound to kg
len = length*.3048;%convert to meters
wid = width*.3048;%convert to meters
d = 1.225; %kg/m^3 = will be a function of altitude in final flight calc
A = len*wid; %planform area m^2
CL = 1.2;%Coefficient of lift

Lift = w;
V = sqrt((Lift*2)/(d*A*CL));%Speed equation

Stall_Speed = V*2.23694; %MPH (Top speed between 2.5-3 X stall speed
Max_Speed = Stall_Speed*3;

%% Drag

cd = .05; %standard drag coefficient of a plane
Drag = 244;%cd*A*0.5*d*V^2;

%% Thrust

diam = 20; %prop diameter
pitch = 8; %prop pitch
RPM = 10000;
C1 = 4.392399*10^-8;
C2 = 4.23333*10^-4;

Thrust = C1*RPM*((diam^3.5)/sqrt(pitch))*(C2*RPM*pitch); %source: http://www.electricrcaircraftguy.com/2013/09/propeller-static-dynamic-thrust-equation.html
%% DATA

LD_Ratio = Lift/Drag;
T_ex = Thrust - Drag;%excess thrust
Acc = T_ex/w;
Thrust
%thr = Thrust*101.97