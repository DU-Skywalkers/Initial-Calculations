clear all
close all
clc

B_Perc = .4;
SA = 2222.3232;

Length = 0;
Width = 0;
RP = 0;


for x = 0:1:132
    L = x;
    for y = 0:1:36
        W = y;
        for z = 0:.01:.4
            R = z;
            
            B = W*B_Perc;
            ll = L*R;
            
            T = L - ll;
            Q = W - B;
            
            Surf = (ll*Q)+(B*L)+((Q*T)/2);
            if Surf>SA
                Length = [Length L];
                Width = [Width W];
                RP = [RP R];                            
            end
        end
    end
end


plot(Length)
hold on
plot(Width)
hold on
%plot(RP*100)
legend('Length','Width','RP')







