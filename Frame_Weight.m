close all
clear all
clc

Fuselage_Length = 40:.25:70;
weight = 0;

for i = Fuselage_Length
Balsa = 0.00347222; %lb/in^3
Spruce = 0.0144676;

TRUSS = 0.5;
SPAR = 0.625;

sparL = SPAR*4;
sparW = SPAR*4;

trussL = TRUSS*4;
trussW = TRUSS*4;

spar_weight = sparL*sparW*i*Spruce;
truss_weight = trussL*trussW*i*Balsa;

Total_Weight = spar_weight + truss_weight;
weight = [weight Total_Weight];

end

corrected_weight = weight(2:end);

plot(Fuselage_Length , corrected_weight);
grid on
xlabel('Length (in)')
ylabel('Weight (lbs)')


