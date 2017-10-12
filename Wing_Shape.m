clear all
close all
clc

prompt = 'Which point would you like to pull?';
point = input(prompt);

%prompt2 = 'What is the wing length?';
%x = input(prompt2);

B_Perc = .4;
SA = 2222.3232;

Length = 0;
Width = 0;
RP = 0;


for x = 0:1:132
    L = x;
    for y = 0:1:36
        W = y;
        for z = .4:.01:.8
            R = z;
            
            B = W*B_Perc;
            ll = L*R;
            
            T = L - ll;
            Q = W - B;
            
            Surf = (ll*Q)+(B*L)+((Q*T)/2);
            
            if Surf>SA && Surf<(SA*1.02)
                Length = [Length L];
                Width = [Width W];
                RP = [RP R];                            
            end
            
        end
    end
end





Wing_Length = Length(point);
Wing_Width = Width(point);
Wing_RP = RP(point)*Wing_Length;

plot(RP*Wing_Length)
hold on
plot(Length)
hold on
plot(Width)
hold on
legend('RP','Length','Width')
xlabel('Iteration')
ylabel('Inches')

wl=['Wing Length = ',num2str(Wing_Length)];
ww=['Wing Width = ',num2str(Wing_Width)];
cl=['Chamfer Location = ',num2str(Wing_RP)];

disp(wl)
disp(ww)
disp(cl)


