clear all
close all
clc

% Cl = 2;
d = 1.225;
s = 1.6129;
L = 244.652;
dv = .00001983;
span = 3.3528;
Bc = .6096;
Tc = Bc*.4;
MAC = Bc-(2*(Bc-Tc)*(0.5*Bc+Tc)/(3*(Bc+Tc)));
ef = .8;
AR = span/MAC;



v = 8:.25:30;
Dps = 0;
Dis = 0;

for i = 1:length(v)
    
Re = (d*v(i)*MAC)/dv;
Cf = 1.328/(sqrt(Re));

sdr = 0.4292120448;

Cd0 = .0533;
Dp = .5*d*(v(i)^2)*Cd0;

Cl = L/(.5*d*(v(i)^2)*s);
Cdi = Cl^2/(pi*AR*ef);
Di = .5*d*(v(i)^2)*Cdi;

Dps = [Dps Dp];
Dis = [Dis Di];

end

vt = sqrt((2*L)/(.5*d*s));
vstall = sqrt((L)/(.5*d*s*1.8));

Dpf = Dps(2:end);
Dif = Dis(2:end);
D = Dpf+Dif;
eff = min(D);
figure(1)
plot(v,Dpf,'r')
hold on
plot(v,Dif,'b')
hold on
plot(v,D);
xlabel('Velocity (m/s)');
ylabel('Drag');
legend('Parasitic Drag','Induced Drag','Drag')
te = strcat('Cruise Speed = ',num2str(eff));
text(6,8,te)

vt
vstall