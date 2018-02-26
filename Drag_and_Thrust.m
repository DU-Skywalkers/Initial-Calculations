clear all
close all
clc

Dinew =  0;
Dpnew = 0;
Dnew = 0;

cl = 1.7

;
%coefficient of lift
s = 135;%span
c = 22;%chord
AR = s/c;%aspect ratio
ef = .75; %efficiency

cdi = (cl^2)/(pi*AR*ef);

cdo = .106;
rho = 0.00004335;
S = s*c;


V = [0	17.6	35.2	52.8	70.4	88	105.6	123.2	140.8	158.4	176	193.6	211.2	228.8	246.4	264	281.6	299.2	316.8	334.4	352	369.6	387.2	404.8	422.4	440	457.6	475.2	492.8	510.4	528	545.6	563.2	580.8	598.4	616	633.6	651.2	668.8	686.4	704	721.6];
Thrust = [147.4	146.2	145.1	144	142.9	141.9	140.8	139.8	138.7	137.7	136.7	135.6	134.6	133.6	132.5	131.5	130.4	129.3	128.2	127.1	126	124.8	123.6	122.3	120.9	119.4	118	116.4	114.8	113	111.3	109.4	107.7	105.8	103.8	101.7	99.6	97.4	95.2	93	90.6	88.1];



for i = 1:length(V)
Di = cdi*(.5*rho*(V(i)^2)*S);
Dinew = [Dinew Di];

Dp = .5*rho*(V(i)^2)*cdo*S;
Dpnew = [Dpnew Dp];



end

Di_correct = fliplr(Dinew(2:end))*.0625;
Dp_correct = Dpnew(2:end)*.0625;

D_correct = Di_correct + Dp_correct;

minD = min(D_correct);
index = find(D_correct == minD);
effspeed = V(index);
V = V*0.0568182;
plot(V,Di_correct,'r')
hold on
plot(V,Dp_correct,'k')
hold on
plot(V, D_correct,'b')
hold on
plot(V, Thrust)
hold on
text(effspeed*0.0568182, minD, num2str(effspeed*0.0568182))
xlabel('Speed (mph)');
ylabel('Force (oz)');
legend('Induced Drag', 'Parasitic Drag', 'Total Drag', 'Thrust')


