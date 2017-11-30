close all
clear all
clc

Cd = .0336;
Ad = 0.49661191;%Drag Area: meters^2
Aw = 2.701;%Wing Area: m^2
rho = 1.225; %air density
V = 12;
Mass = 36.38;%Kg

Thrustm = 0;
L1 = 0;

AOA = 7; %deg
Cl = 1.609089;
Cd = [0.198652	0.19249	0.189451	0.18774	0.186467	0.185674	0.185021	0.184462	0.18398	0.183588	0.183241	0.182915	0.182594	0.18228	0.181973	0.181715	0.181504	0.181324	0.181173	0.181034	0.180908	0.180787	0.180674	0.180565	0.180462	0.18036	0.180263	0.180172	0.180081];
V = [2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30];

for i = 1:length(Cd)
Drag = Cd(i)*((rho*(V(i)^2))/2)*Ad;
Thrust_min = Drag+(Mass*9.81);%newtons
Thrustm = [Thrustm Thrust_min];

Lift = Cl*((rho*(V(i)^2))/2)*Aw;
L1 = [L1 Lift];
end

Thrust_minimum = Thrustm(2:end);
L = L1(2:end);
subplot(2,1,1)
plot(V,Thrust_minimum)
hold on
grid on
xlabel('Velocity (m/s)')
ylabel('Minimum Thrust (N)')

Y = Mass*9.81;

subplot(2,1,2)
plot(V,L,'r')
hold on
refline(0,Y)
grid on
xlabel('Velocity (m/s)')
ylabel('Lift (N)')


diam = 8;
pitch = 4.5;
Volts = 22.2;
Kv = 580;

cells = 3;
efficiency = .8;
RPM = Kv*Volts*cells*efficiency;
k = 5.3*10^-15;
Pwr = k*RPM^3*diam^4*pitch;

Thrust = sqrt((pi/2)*(diam*.0254)^2*rho*Pwr^2)
Acceleration = (Thrust - Thrust_min)/Mass %m/sec^2


