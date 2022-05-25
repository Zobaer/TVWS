clc; clear; close all;
font = 22;
d_km = [0.175443841 3.056986307 5.45921138 8.14218011 10.18929855];
rec_pow_dbm = [-23.56 -47.71 -63.53 -65.49 -75.36];
PL_dB = 27.78 -1.*rec_pow_dbm;
d_m = d_km*1000;
d0 = 175.44; %m, assume
d_db = 10*log10(d_m/d0);

X = transpose([ones(1,length(d_db)); d_db]);
Y = transpose(PL_dB);
XT = transpose(X);
theta = transpose(inv(XT*X)*(XT*Y))

figure(1);
%txt = 'Slope = '+ string(theta(2));
plot(d_db, PL_dB, 'mo',...
    'LineWidth',1.5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'MarkerSize',10.5);grid on;hold on;
x = min(d_db)-2:.01:max(d_db)+2;
plot(x, theta(1)+theta(2).*x,'-m',...
    'LineWidth',2.5);
%text(mean(x)-5,mean(PL_dB)-6,txt,'FontSize',font,'FontWeight','b','Color','m');
%title("Path Loss (dB) vs Distance (dB)",'FontSize',15);
xlabel("Distances from Base Radio (d/d_0)_d_B",'FontSize',font,'FontWeight','b');
ylabel("Path Loss (dB)",'FontSize',font,'FontWeight','b');
set(gca,'FontSize',font,'FontWeight','b');
plot(x, 72.916+2.*x,'color', [0 0.5 0],...
    'LineWidth',2.5);
legend("Measured path loss","Modeled path loss","Ideal path loss",'FontSize',font,'FontWeight','b');
