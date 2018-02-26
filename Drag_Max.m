
W = 55; % weight, lbf
S = 29.07;  % wing reference area, ft^2;
A = 7.31; % wing aspect ratio
C_D0 = 0.0065; % flaps up parasite drag coefficient
e = 0.98; % airplane efficiency factor

h = 0; % altitude, (ft)
phi = 0; % bank angle, deg

h_m = convlength(h,'ft','m');

[T, a, P, rho] = atmoscoesa(h_m, 'Warning');

rho = convdensity(rho,'kg/m^3','slug/ft^3');
   
TAS_bg = sqrt((2*W) / (rho*S))...
         *(1./(4*C_D0.^2 + C_D0.*pi*e*A*cos(phi)^2)).^(1/4); % TAS, fps
     
     KTAS_bg = convvel(TAS_bg,'ft/s','kts')';
     
     KCAS_bg = correctairspeed(KTAS_bg,a,P,'TAS','CAS')';
     
     gamma_bg_rad = asin( -sqrt((4.*C_D0')./(pi*e*A*cos(phi)^2 + 4.*C_D0')) );
     
     gamma_bg = convang(gamma_bg_rad,'rad','deg');
     
     D_bg = -W*sin(gamma_bg_rad);
     
     L_bg =  W*cos(gamma_bg_rad);
     
     qbar = dpressure([TAS_bg' zeros(size(TAS_bg,2),2)], rho);
     
     C_D_bg = D_bg./(qbar*S);
C_L_bg = L_bg./(qbar*S);

TAS = (70:200)'; % true airspeed, fps
KTAS = convvel(TAS,'ft/s','kts')'; % true airspeed, kts
KCAS = correctairspeed(KTAS,a,P,'TAS','CAS')'; % corrected airspeed, kts

qbar = dpressure([TAS zeros(size(TAS,1),2)], rho);

Dp = qbar*S.*C_D0;

Di = (2*W^2)/(rho*S*pi*e*A).*(TAS.^-2);

D = Dp + Di;

L = W;

h1 = figure;
plot(KCAS,L./D);
title('L/D vs. KCAS');
xlabel('KCAS'); ylabel('L/D');
hold on
plot(KCAS_bg,L_bg/D_bg,'Marker','o','MarkerFaceColor','black',...
    'MarkerEdgeColor','black','Color','white');
hold off
legend('L/D','L_{bg}/D_{bg}','Location','Best');
annotation('textarrow',[0.49 0.49],[0.23 0.12],'String','KCAS_{bg}');

h2 = figure;
plot(KCAS,Dp,KCAS,Di,KCAS,D);
title('Parasite, induced, and total drag curves');
xlabel('KCAS'); ylabel('Drag, lbf');
hold on
plot(KCAS_bg,D_bg,'Marker','o','MarkerFaceColor','black',...
    'MarkerEdgeColor','black','Color','white');
hold off
legend('Parasite, D_p','Induced, D_i','Total, D','D_{bg}','Location','Best');
annotation('textarrow',[0.49 0.49],[0.23 0.12],'String','KCAS_{bg}');

