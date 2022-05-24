%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% What's in it:
% 1) Heatmap of received power (download) with 18 data points (no-signal 
%    points and feed lot are included)
% 2) Heatmap of SNR (download) with 18 data points (no-signal points  and
%    feed lot are included)
% 3) Heatmap of Data rate (download) with 18 data points (no signal points
%    and feed lot are included, set negative data rates to zero forcefully
% 4) Heatmap of Data rate (Upload) with 18 data points (no signal points
%    and feed lot are included, set negative data rates to zero forcefully
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear; close all;

%Create TVWS transmitter
tx = txsite('Name','OSUFeedmill',"AntennaHeight",30.5,...
    'Latitude', 36.118744, 'Longitude', -97.139919,'TransmitterFrequency',602e6);

%lattitude-longitude of 15 test locations where we got internet connections
lat15 = [36.120224 36.18896 36.18564 36.163203 36.129043 36.141234 ...
    36.128542 36.144875 36.173705 36.15922 36.130452 36.178684 36.144386 ...
    36.191451 36.146176];
lon15 = [-97.139242 -97.128612 -97.1237 -97.123324 -97.122379 ...
    -97.120342 -97.112099 -97.109953 -97.105574 -97.105512 -97.091567 ...
    -97.087832 -97.087032 -97.070844 -97.069176];

%lattitude-longitude of two test locations where no internet was received
lon_ns = [-97.069638 -97.070747];
lat_ns = [36.159575 36.174701];

%lattitude-longitude of OSU feed lot 36.1373976,-97.1127297
lon_feedlot = -97.113285; %this is correct one
lat_feedlot = 36.136259; %this is correct one

%lattitude-longitude of 17 test locations, including no-signal points, excluding feedlot
lat17 = [lat15 lat_ns];
lon17 = [lon15 lon_ns];

%lattitude-longitude of 18 test locations, including no-signal points and feedlot
lat18 = [lat17 lat_feedlot];
lon18 = [lon17 lon_feedlot];

%received power, SNR and data rate (download) and data rate (upload) of
% 15 test points
pow15 = [-23.56 -74.82 -70.71 -61.13 -63.63 -47.71 -57.17 -62.28 ...
    -71.56 -63.53 -64.03 -65.49 -59.1 -75.36 -75.36 ];
SNR15 = [ 45.36 3.44 9.21 14.44 14.19 29.44 18.82 14.79 6.95 13.44 ...
    11.05 14.45 16.21 4.37 3.9 ];
drdl15 = [ 17.07 5.05 11.17 13.27 16.48 17.39 17 15.6 10.78 15.11 ...
    1.71 15.5 15.24 4.81 4.88 ];
drul15 = [ 16.53	1.64	6.59	15.44	13.25	16.63	9.46	...
    8.28	6.66	13.26	13.16	11.39	13.67	1.66	1.63 ];

%Received power at no-signal points (considering only noise powers)
pow_ns = [0 0];
%pow17 = [dr15 dr_ns];

%SNR at no-signal points (considering only noise powers)
SNR_ns = [0 0];
%SNR17 = [SNR15 SNR_ns];

%data rate download with no signal points
drdl_ns = [0 0];


%data rate upload with no signal points
drul_ns = [0 0];

% all data at OSU feedlot
pow_feedlot = 0;
SNR_feedlot = 0;
drdl_feedlot = 17.28; %independent max of all readings
drul_feedlot = 16.55; %independent max of all readings

drdl18 = [drdl15 drdl_ns drdl_feedlot];
drul18 = [drul15 drul_ns drul_feedlot];

%interpolation with 18 points
n = 100;

lon18_i = linspace(min(lon18),max(lon18),n);
lat18_i = linspace(min(lat18),max(lat18),n);
[lon18_im, lat18_im] = meshgrid(lon18_i,lat18_i);
%pow15_im = griddata(lon15,lat15,pow15,lon15_im,lat15_im,'v4');
%SNR15_im = griddata(lon15,lat15,SNR15,lon15_im,lat15_im,'v4');
drdl18_im = griddata(lon18,lat18,drdl18,lon18_im,lat18_im,'v4');
drul18_im = griddata(lon18,lat18,drul18,lon18_im,lat18_im,'v4');

% %interpolation with 17 points including no sig points for data rate only
% lon17_i = linspace(min(lon17),max(lon17),n);
% lat17_i = linspace(min(lat17),max(lat17),n);
% [lon17_im, lat17_im] = meshgrid(lon17_i,lat17_i);
% dr17_im = griddata(lon17,lat17,dr17,lon17_im,lat17_im,'v4');

%Create 15 TVWS receivers
rx_names15 = "rx_site_" + (1:15);
rx15 = rxsite('Name',rx_names15,"AntennaHeight",3.6, 'Latitude', lat15', 'Longitude', lon15');

%Create 17 TVWS receivers (including no signal points)
rx_names17 = "rx_site_" + (1:17);
rx17 = rxsite('Name',rx_names17,'Latitude', lat17', 'Longitude', lon17');

%Create 18 TVWS receivers (including no signal points)
rx_names18 = "rx_site_" + (1:18);
rx18 = rxsite('Name',rx_names18,'Latitude', lat18', 'Longitude', lon18');

%create propagationdata
%signalStrength = sigstrength(rx15, tx)';
%tbl = table(lat15', lon15', signalStrength);
%pd = propagationData(tbl);

% pd = propagationData(lat15', lon15',"sig_power",pow15);
% legendTitle = "Signal" + newline + "Strength" + newline + "(dB)";
% plot(pd, "LegendTitle", legendTitle);
%surf(lon15_im,lat15_im,pow15_im);

% %received_power
% show(tx);
% %show(rx15);
% show(rx15);
% pd = propagationData(lat15_im(:), lon15_im(:),"sig_power",pow15_im(:));
% legendTitle = "Received" + newline + "Power (DL)" + newline + "(dBm)";
% contour(pd, "LegendTitle", legendTitle);
% 
% %SNR
% v2 = siteviewer;
% show(tx);
% show(rx15);
% pd = propagationData(lat15_im(:), lon15_im(:),"SNR",SNR15_im(:));
% legendTitle = "SNR (DL)"+newline+"(dBm)";
% contour(pd, "LegendTitle", legendTitle);

%data rate download with 18 points (including no signal points and feed lot
v3 = siteviewer;
show(tx);
show(rx18);
drdl18_im_nz = max(0,drdl18_im);
pd = propagationData(lat18_im(:), lon18_im(:),"sig_power",drdl18_im_nz(:));
legendTitle = "Through-" + newline + "put (DL)" + newline + "(Mbps)";
contour(pd, "LegendTitle", legendTitle);

%data rate upload with 18 points (including no signal points and feed lot
v4 = siteviewer;
show(tx);
show(rx18);
drul18_im_nz = max(0,drul18_im);
%drul18_im_nz = drul18_im;
pd = propagationData(lat18_im(:), lon18_im(:),"sig_power",drul18_im_nz(:));
legendTitle = "Through-" + newline + "put (UL)" + newline + "(Mbps)";
contour(pd, "LegendTitle", legendTitle);

