clc; clear; close all;

[dat24, text24, fil24] = xlsread("dat24");
[dat25, text25, fil25] = xlsread("dat25");


len = length(dat24);
for i=1:len
    dt24(i) = datetime(dat24(i,1), dat24(i,2), dat24(i,3), ...
        dat24(i,4), dat24(i,5),dat24(i,6) );
end

len = length(dat25);
for i=1:len
    dt25(i) = datetime(dat25(i,1), dat25(i,2), dat25(i,3), ...
        dat25(i,4), dat25(i,5),dat25(i,6) );
end


figure(1);
subplot(211);
plot(dt24,(dat24(:,7)/1000000)',"LineWidth",1.5); hold on;
plot(dt24,(dat24(:,8)/1000000)',"r","LineWidth",1.5); grid on;
h1=legend("Download","Upload"); h1.FontSize = 16;
xlabel("Date-time", "FontSize", 17, "FontWeight", "bold");
ylabel("Throughput (Mbps)", "FontSize", 17, "FontWeight", "bold");
ylim([0 20]);
set(gca,'FontSize',16);

subplot(212);
plot(dt25,(dat25(:,7)/1000000)',"LineWidth",1.5); hold on;
plot(dt25,(dat25(:,8)/1000000)',"r","LineWidth",1.5); grid on;
h2=legend("Download","Upload");h1.FontSize = 16;
xlabel("Date-time", "FontSize", 17, "FontWeight", "bold");
ylabel("Throughput (Mbps)", "FontSize", 17, "FontWeight", "bold");
ylim([0 20]);
set(gca,'FontSize',16);


x = dat24(:,7)/1000000;
y = dat25(:,7)/1000000;
z = [x' y'];
max_dl = max(z)
min_dl = min(z)
avg_dl = sum(z)/length(z)

xx = dat24(:,8)/1000000;
yy = dat25(:,8)/1000000;
zz = [xx' yy'];
max_ul = max(zz)
min_ul = min(zz)
avg_ul = sum(zz)/length(zz)