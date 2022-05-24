clc; clear; close all;
T0 = readtable("2020-10-22");
T1 = readtable("2020-10-23");
T2 = readtable("2020-10-24");
T3 = readtable("2020-10-25");
T4 = readtable("2020-10-26");
% T5 = readtable("2021-03-20");
% T6 = readtable("2021-03-21");
% T7 = readtable("2021-03-22");


T = [T1; T2; T3; T4];
%T = [T7; T8; T9; T10];

ts = string(T.Timestamp);
ts_no_z = ts.erase("Z");
ts_no_t = strrep(ts_no_z,"T"," ");
dt_main = datetime(ts_no_t);

days = day(dt_main);
minday = min(days);
maxday = max(days);

legend_fontsize = 16;
graph_linewidth = 1.5;
axislabel_fontsize = 17;
axistitle_fontsize = axislabel_fontsize + 3;
axis_fontsize = 16;
axis_limit_tp = 20;
axis_limit_lt = 40;

f=1;
for i = minday+1:4:maxday
    dt1 = find(days==i);
    dt2 = find(days==i+1);
    %dt3 = find(days==i+2);
    figure(f);
    
    subplot(221);
    %subplot(411);
    plot(dt_main(dt1),T.Download(dt1)/1000000,"LineWidth",graph_linewidth); grid on; hold on;
    plot(dt_main(dt1),T.Upload(dt1)/1000000,"LineWidth",graph_linewidth); grid on; hold on;
    h1 = legend("Download","Upload");
    h1.FontSize = legend_fontsize;
    %set(h1,'Position',[0.840156250558793 0.79400692918035 0.0640624988824129 0.0429362869328739],'FontSize',legend_fontsize);
    xlabel("Date-time", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylabel("Throughput (Mbps)", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylim([0 axis_limit_tp])
    set(gca,'FontSize',axis_fontsize);
    title("Throughput (DL & UL) on Oct 24, 2020", "FontSize", axistitle_fontsize);
    
    
    subplot(223);
    %subplot(412);
    plot(dt_main(dt2),T.Download(dt2)/1000000,"LineWidth",graph_linewidth); grid on; hold on;
    plot(dt_main(dt2),T.Upload(dt2)/1000000,"LineWidth",graph_linewidth); grid on; hold on;
    h2 = legend("Download","Upload");
    h2.FontSize = legend_fontsize;
    %set(h2,'Position',[0.840277778895364 0.497537705064664 0.0640624988824129 0.0429362869328739],'FontSize',legend_fontsize);
    xlabel("Date-time", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylabel("Throughput (Mbps)", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylim([0 axis_limit_tp]);
    set(gca,'FontSize',axis_fontsize);
    title("Throughput (DL & UL) on Oct 25, 2020", "FontSize", axistitle_fontsize);
    
    
    %Latency
    subplot(222);
    %subplot(413);
    plot(dt_main(dt1),T.Ping(dt1),"LineWidth",graph_linewidth, 'Color', [0 0.5 0]); grid on; hold on;
    xlabel("Date-time", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylabel("Latency (ms)", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylim([0 axis_limit_lt])
    set(gca,'FontSize',axis_fontsize);
    title("Latency on Oct 24, 2020", "FontSize", axistitle_fontsize);
    
    subplot(224);
    %subplot(414);
    plot(dt_main(dt2),T.Ping(dt2),"LineWidth",graph_linewidth,'Color', [0 0.5 0]); grid on; hold on;
    xlabel("Date-time", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylabel("Latency (ms)", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylim([0 axis_limit_lt]);
    set(gca,'FontSize',axis_fontsize);
    title("Latency on Oct 25, 2020", "FontSize", axistitle_fontsize);
    
    f=f+1;
    
    zz_dl = [T.Download(dt1)/1000000; T.Download(dt2)/1000000];
    zz_ul = [T.Upload(dt1)/1000000; T.Upload(dt2)/1000000];
    zz_lt = [T.Ping(dt1); T.Ping(dt2)];
    max_dl = max(zz_dl)
    min_dl = min(zz_dl)
    avg_dl = sum(zz_dl)/length(zz_dl)
    max_ul = max(zz_ul)
    min_ul = min(zz_ul)
    avg_ul = sum(zz_ul)/length(zz_ul)
    max_lt = max(zz_lt)
    min_lt = min(zz_lt)
    avg_lt = sum(zz_lt)/length(zz_lt)
end