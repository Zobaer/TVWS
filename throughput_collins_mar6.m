clc; clear; close all;

[dat4, text4, fil4] = xlsread("dat4");

len = length(dat4);
for i=1:len
    dt4(i) = datetime(dat4(i,1), dat4(i,2), dat4(i,3), ...
        dat4(i,4), dat4(i,5),dat4(i,6) );
end


figure(1);

plot(dt4,(dat4(:,7)/1000000)',"LineWidth",1.5); hold on;
plot(dt4,(dat4(:,8)/1000000)',"r","LineWidth",1.5); grid on;
h=legend("Download","Upload");
h.FontSize = 16;
xlabel("Date-time", "FontSize", 17, "FontWeight", "bold");
ylabel("Throughput (Mbps)", "FontSize", 17, "FontWeight", "bold");
ylim([0 20]);
set(gca,'FontSize',16);

z = dat4(:,7)/1000000;
max_dl = max(z)
min_dl = min(z)
avg_dl = sum(z)/length(z)

zz = dat4(:,8)/1000000;
max_ul = max(zz)
min_ul = min(zz)
avg_ul = sum(zz)/length(zz)
