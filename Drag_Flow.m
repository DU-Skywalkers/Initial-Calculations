clear all
clc
close all

Drag = 21.75;%N
rho = 1.225;
A = 5507.139*0.00064516;
S = 2757.720*0.00064516;
V = 15;

Cd = (Drag/(rho*A*V^2))*2;
liftplot = [0];

alpha = [0 1 1.5 2 2.5 3 3.5 4.5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12 12.5 13	13.5 14	14.5 15];
ClCd = [81.86426	90.40702	91.08017	91.77912	93.73003	95.24436	96.47625	98.63251	96.03935	96.11894	95.95595	95.52406	94.74441	93.59243	91.24843	89.4259	88.67121	87.19885	84.90436	80.87282	79.32916	76.6534	71.71425	62.62488	54.42271	47.74651	41.89399	35.59985];
Cl = 0;

for i = 1:length(alpha)
Cli = ClCd(i)*Cd;
Cl = [Cl Cli];
Lift = Cli*(S)*((rho*V^2)/2)*.224809;%pounds
liftplot = [liftplot Lift];
end
liftadjust = liftplot(2:end);

Clmax = max(Cl);
Lstall = find(Cl==Clmax);
L = liftadjust(9)/.224809;

Vstall = sqrt(L/(rho*S*Clmax))%m/s
plot(alpha, liftadjust)
xlabel('Angle of Attack')
ylabel('Lift Force(lbf)')