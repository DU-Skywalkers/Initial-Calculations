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
        for z = 0:.01:1
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


plot(RP*100)
hold on
plot(Length)
hold on
plot(Width)
hold on
legend('Length','Width','RP')


Wing_Length = Length(2);
Wing_Width = Width(2);
Wing_RP = RP(2)*Wing_Length;

wl=['Wing Length = ',num2str(Wing_Length)];
ww=['Wing Width = ',num2str(Wing_Width)];
cl=['Chamfer Location = ',num2str(Wing_RP)];

disp(wl)
disp(ww)
disp(cl)


