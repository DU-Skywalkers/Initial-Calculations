clear all
close all
clc
%% Weight -> Lift -> Drag -> Thrust

%% weight
weight = 41*.453592*9.81;%weight 55 lbs in newtons

%% Lift

d = 1.225; %kg/m^3 = will be a function of altitude in final flight calc
CL = 1.2;%Coefficient of lift
vp = 11;% take off speed m/s

Lift = weight;
length = 11*.3048;
SA = 0;
speeds = [5:1:23];

for i = speeds
vel = i;
S = ((2*Lift)/(d*vel^2*CL));

width = (S/length);%*3.28084;
SA = [SA S];
end

take = ((2*Lift)/(d*vp^2*CL));

plot (speeds,SA(2:end))
hold on
plot(vp,take,'r*')
ylabel('Surface area m^2')
xlabel('Speed m/s')
x1 = vp;
y1 = take;
txt1 = ['   ', num2str(vp) ,'m/s take off speed, SA =',num2str(take),'m^2'];
text(x1,y1,txt1);

surf = take*10.7639
wit = (take*10.7639)/11;%width in feet of wing


%% Drag

DA = 22;%drag area
V = vp;%stall velocity
cd = .05; %standard drag coefficient of a plane

Drag = cd*DA*0.5*d*V^2;

%% Thrust

diami = 15;
pitch = 6;

RPM = 18000;

C1 = 4.392399*10^-8;
C2 = 4.23333*10^-4;

propC = .015;
P = RPM*propC;
Thrust = C1*RPM*((diami^3.5)/sqrt(pitch))*(C2*RPM*pitch); %source: http://www.electricrcaircraftguy.com/2013/09/propeller-static-dynamic-thrust-equation.html
%% DATA

T_ex = Thrust - Drag;%excess thrust
acc = T_ex/weight%acceleration achievable
% dis = (0.3048*170);
%TOV = sqrt(2*acc*dis)
dis = ((vp^2)/(2*acc))*3.28084
time = (2*(dis))/vp;
Thrust
