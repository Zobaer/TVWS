clc; clear all; close all;

%a for azimuth, e for elevation, d for download, u for upload, p for
%received power, s for snr and d for data rate
a	=  [	-90	-80	-70	-60	-50	-40	-30	-20	-10	-5	0	30	60	70	90	];

apd	=  [	-74.06	-75.53	-72.53	-60.03	-56.25	-52.545	-50.67	-48.99	-47.84	-48.36	-48.73	-51.94	-60.25	-70.19	-72.86	];
asd	=  [	3.89	2.8	5.92	16.84	20.53	23.585	25.08	26.2	27.765	28.08	27.20	25.25	16.9	9.235	6.69	];
add	=  [	4.07	3.24	9.10	17.24	16.92	16.85	16.915	16.86	16.745	16.925	17.02	17.09	16.77	10.36	3.28	];

apu	=  [	-79	-80	-76.67	-66	-62	-58.5	-56	-55	-54	-54	-54.00	-58	-67	-75.5	-78	];
asu	=  [	4	2	6.33	16	20	23	26	27	28	28	27.67	24	15	8	5	];
adu	=  [	1.595	1.6	5.83	16.58	16.58	16.605	16.58	16.62	16.56	16.62	16.58	16.57	16.58	5.295	1.61	];
																	
e	=  [	-70	-60	-50	-40	-30	0	5	10	20	30	40	50	60	70	90	];

epd	=  [	-65.1	-64.58	-58.56	-55.67	-53.61	-48.73	-49.255	-49.045	-50.06	-53.53	-53.86	-59.56	-66.99	-74.17	-78.27	];
esd	=  [	6.6	7.975	12.04	15.79	17.84	27.20	29.135	29.16	27.35	23.57	23.71	18.4	11.26	4.65	0.85	];
edd	=  [	11.38	9.885	15.31	16.88	16.68	17.02	17.145	17.23	17.17	17.21	16.73	16.67	13.84	5.01	1.65	];

epu	=  [	-73	-72	-65	-61	-60	-54.00	-55	-55	-56	-59	-68	-66	-73	-80	-81	];
esu	=  [	10	12	17	21	22	27.67	26.5	27	26	23	21	16	10	3	2	];
edu	=  [	11.06	11.82	16.59	16.4	16.58	16.58	16.575	16.58	16.62	16.62	16.59	16.58	9.8	1.63	1.37	];


figure;
subplot(231);
plot(a,apd,'b','LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Received power (Download) (dBm)','fontweight','bold','fontsize',14);
title('Azimuth vs Received Power (Download)','fontsize',18);
subplot(232);
plot(a,asd,'color',[0 0.5 0],'LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Signal to Noise ratio (Download) (dB)','fontweight','bold','fontsize',14);
title('Azimuth vs SNR (Download)','fontsize',18);
subplot(233);
plot(a,add,'r','LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Throughput (Download) (Mbps)','fontweight','bold','fontsize',14);
title('Azimuth vs Throughput (Download)','fontsize',18);

subplot(234);
plot(a,apu,'b','LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Received power (Upload) (dBm)','fontweight','bold','fontsize',14);
title('Azimuth vs Received Power (Upload)','fontsize',18);
subplot(235);
plot(a,asu,'color',[0 0.5 0],'LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Signal to Noise ratio (Upload) (dB)','fontweight','bold','fontsize',14);
title('Azimuth vs SNR (Upload)','fontsize',18);
subplot(236);
plot(a,adu,'r','LineWidth',2);grid on;xlabel('Azimuth Angle (degree)','fontweight','bold','fontsize',14);ylabel('Throughput (Upload) (Mbps)','fontweight','bold','fontsize',14);
title('Azimuth vs Throughput (Upload)','fontsize',18);

figure;
subplot(231);
plot(e,epd,'b','LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Received power (Download) (dBm)','fontweight','bold','fontsize',14);
title('Elevation vs Received Power (Download)','fontsize',18);
subplot(232);
plot(e,esd,'color',[0 0.5 0],'LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Signal to Noise ratio (Download) (dB)','fontweight','bold','fontsize',14);
title('Elevation vs SNR (Download)','fontsize',18);
subplot(233);
plot(e,edd,'r','LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Throughput (Download) (Mbps)','fontweight','bold','fontsize',14);
title('Elevation vs Throughput (Download)','fontsize',18);

subplot(234);
plot(e,epu,'b','LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Received power (Upload) (dBm)','fontweight','bold','fontsize',14);
title('Elevation vs Received Power (Upload)','fontsize',18);
subplot(235);
plot(e,esu,'color',[0 0.5 0],'LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Signal to Noise ratio (Upload) (dB)','fontweight','bold','fontsize',14);
title('Elevation vs SNR (Upload)','fontsize',18);
subplot(236);
plot(e,edu,'r','LineWidth',2);grid on;xlabel('Elevation Angle (degree)','fontweight','bold','fontsize',14);ylabel('Throughput (Upload) (Mbps)','fontweight','bold','fontsize',14);
title('Elevation vs Throughput (Upload)','fontsize',18);

