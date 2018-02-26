clear all
close all
clc
%% Initial Calcs

Flight_Altitude = 200;
Speed = [10 13 13 13 10];
SP = Speed*3.28084;

A = -pi/2;
B = pi/2;
C = pi/2;
D = sqrt(2)*pi;

t1 = linspace(A, B, 100); 
t2 = linspace(C,D,100);
r = 200;

%% Path

X1 = [0 170 400];
Y1 = [0 0 0];
Z1 = [0 0 Flight_Altitude];
d1 = diff([X1(:) Y1(:) Z1(:)]); 
L1 = sum(sqrt(sum(d1.*d1,2)));
S1 = SP(1);
X2 = (r * cos(t1))+400;
Y2 = (r * sin(t1))+200;
Z2 = ones(1,100)*Flight_Altitude;
d2 = diff([X2(:) Y2(:) Z2(:)]); 
L2 = sum(sqrt(sum(d2.*d2,2)));
S2 = SP(2);

X3 = [X2(end) X2(end)-600];
Y3 = [Y2(end) Y2(end)];
Z3 = [Z2(end) Z2(end)];
d3 = diff([X3(:) Y3(:) Z3(:)]); 
L3 = sum(sqrt(sum(d3.*d3,2)));
S3 = SP(3);

X4 = (r * cos(t2))-200;
Y4 = (r * sin(t2))+200;
Z4 = ones(1,100)*Flight_Altitude;
d4 = diff([X4(:) Y4(:) Z4(:)]); 
L4 = sum(sqrt(sum(d4.*d4,2)));
S4 = SP(4);

X5 = [X4(end) X1(1)];
Y5 = [Y4(end) Y1(1)];
Z5 = [Z4(end) Z1(1)];
d5 = diff([X5(:) Y5(:) Z5(:)]); 
L5 = sum(sqrt(sum(d5.*d5,2)));
S5 = SP(5);

%% Concatination

X = [X1 X2 X3 X4 X5];
Y = [Y1 Y2 Y3 Y4 Y5];
Z = [Z1 Z2 Z3 Z4 Z5];

%% Post Calcs

T1 = L1/S1;
T2 = L2/S2;
T3 = L3/S3;
T4 = L4/S4;
T5 = L5/S5;

Length = L1+L2+L3+L4+L5;
Time = T1+T2+T3+T4+T5;
  
    
%% Plot

figure(1)
p1 = plot3(X1, Y1, Z1);
hold on
p2 = plot3(X2, Y2, Z2);
hold on
p3 = plot3(X3, Y3, Z3);
hold on
p4 = plot3(X4, Y4, Z4);
hold on
p5 = plot3(X5, Y5, Z5);
hold on
grid on
axis equal


leg1 = strcat('Speed = ', num2str(round(S1)),'ft/s');
leg2 = strcat('Speed = ', num2str(round(S2)),'ft/s');
leg3 = strcat('Speed = ', num2str(round(S3)),'ft/s');
leg4 = strcat('Speed = ', num2str(round(S4)),'ft/s');
leg5 = strcat('Speed = ', num2str(round(S5)),'ft/s');

legend([p1 p2 p3 p4 p5],leg1,leg2,leg3,leg4,leg5)

%% Output

fprintf('Distance (ft) = %s \n', num2str(Length))
fprintf('Time (s) = %s \n', num2str(Time))
