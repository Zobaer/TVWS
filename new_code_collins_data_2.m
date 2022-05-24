clc; clear; close all;
T0 = readtable("2021-03-31");
T1 = readtable("2021-04-01");
T2 = readtable("2021-04-02");
% T5 = readtable("2021-03-20");
% T6 = readtable("2021-03-21");
% T7 = readtable("2021-03-22");


T = [T0; T1];
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
axis_fontsize = 16;
axis_limit_tp = 20;
axis_limit_lt = 55;

f=1;
for i = minday:4:maxday
    dt1 = find(days==i);
    %dt2 = find(days==i+1);
    %dt3 = find(days==i+2);
    figure(f);
    
    subplot(211);
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
    title("Throughput (DL & UL) on Mar 6, 2021", "FontSize", axislabel_fontsize+1.3);
    
    
    %Latency
    subplot(212);
    %subplot(413);
    plot(dt_main(dt1),T.Ping(dt1),"LineWidth",graph_linewidth, 'Color', [0 0.5 0]); grid on; hold on;
    xlabel("Date-time", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylabel("Latency (ms)", "FontSize", axislabel_fontsize, "FontWeight", "bold");
    ylim([0 axis_limit_lt])
    set(gca,'FontSize',axis_fontsize);
    title("Latency on Mar 6, 2021, 2020", "FontSize", axislabel_fontsize+1.3);
    
    f=f+1;
    
    zz_dl = [T.Download(dt1)/1000000];
    zz_ul = [T.Upload(dt1)/1000000];
    zz_lt = [T.Ping(dt1)];
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