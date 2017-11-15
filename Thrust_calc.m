clear all
close all
clc

diam = 8;
pitch = 4.5;
Volts = 22.2;
Kv = 580;

mass = 55;%mass of aircraft
cells = 3;
efficiency = .8;
Drag = 21.75*.224809;%pounds
den = 1.225;
RPM = Kv*Volts*cells*efficiency;
k = 5.3*10^-15;
Power = k*RPM^3*diam^4*pitch;

Thrust = sqrt((pi/2)*(diam*.0254)^2*den*Power^2)*0.224809
%pounds
Acceleration = (Thrust - Drag)/mass %ft/sec^2

