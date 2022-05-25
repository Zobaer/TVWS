# TVWS Based Broadband Internet Connectivity

Objective of this project was to explore the challenges and opportunities related to bringing broadband internet connectivity to farmers and ranchers in Harmon and Tillman Counties by using TVWS technology. In collaboration with partners at Pioneer Telephone Cooperative Inc., and potential user Collins Cattle at Tillman county, OK, the team will pursue the following major aims:
1.	Develop and test a communication system model using TVWS technology, identify its potential benefits and limitations and thus devise solutions for farm and ranch-level implementation of broadband internet connectivity and associated digital services.
2.	Understand end-user preferences and usage patterns for TVWS enabled broadband internet connectivity through live system monitoring and performance evaluation.

![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/connection_diagram.png)


# Description of the files:

1) All the cvs and xlsx files are data collected from receiver end using a python script. The data contain upload throughput, download throughput, latency date collected after every 5 minutes interval for a day
2) Heatmap.m: This is MATLAB code for creating heatmaps of throughput (upload and download), SNR and received power around OSU feedlot where the TVWS transmitter was mounted on a tower.
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/rp_main.jpg)

3) CollinsCattle_LOS_Simulation.m: This is MATLAB simulation code for availability of line of sight at Collins cattle, Tillman county from two Pioneer cell towers.
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/tillman_los_sim.jpg)

4) LifeChurchPlots_azimuth_elevation.m: This is MATLAB code for evaluating effects of azimuth and elevation angles of receiver antenna on the network parameters like throughput (upload and download) and received power. At Lifechurch of Stillwater, OK, data were collected by varying azimuth and elevation of receiver antenna and those data were plotted using this code.
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/Azimuth_tp.jpg)

![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/Elevation_tp.jpg)

5) new_code_collins_data_2.m and throughput_collins_mar6.m: MATLAB code for plotting upload and download throughput and latency data for different days when the service was live at Collins cattle, Tillman county, OK, USA.
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/collins_performance.png)

6) new_code_feedlot.m and oct24_25_throughput_feedlot.m: MATLAB code for plotting upload and download throughput and latency data for different days when the service was live at Collins cattle, Tillman county, OK, USA.
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/feedlot_tp_lat_oct_24_25.png)

7) Pathloss_analysis.m: MATLAB code for pathloss analysis in Stillwater (Transmitter mounted at OSU feed mill)
![alt text](https://github.com/Zobaer/TVWS/blob/main/figs/TVWS_pathloss.png)



# Key outcome fromt he project:
1.	Inside lab, testing with single channel and dual channel resulted in 10.7 Mbps and 18.6 Mbps download throughputs respectively which were 82.3% and 77.5% of maximum throughput possible (24 Mbps) using Adaptrum TVWS radios. The upload throughputs were similar too. There was no control from user level on modulation rate used to modulate the transmitted signal in Adaptrum radios. The download signal to noise ratio (SNR) was high (48.52 dB). With this SNR, throughputs would have been higher if the radios chose higher order modulation (256QAM instead of 64QAM) for modulating the signal.
2.	In outdoor testing, maximum download throughput of 17 Mbps (two days average 16.54 Mbps) and minimum latency of 26.83 ms (two days average 28.19 ms) were received at 3.08 km distance at OSU feedlot. Collected throughput and latency data for two days were plotted by MATLAB and quite stable throughput and low latency were observed. Upload throughput was good too, maximum 16.1 Mbps and an average of 14.1 Mbps.
3.	Received signal power, SNR and throughput data for both upload and download collected at Life church have been plotted against varying antenna azimuth and elevation for further study. It was noticed that the signal parameters reached their peaks when the client antenna was aligned with the base antenna, in both horizontal (azimuth angle 0o) and vertical (elevation angle 0o) planes. At both sides of the peak, received power and SNR values decreased immediately, but throughput value, which was the most important parameter for users, remained at its peak within a range of -50o to +50o antenna angles at 3.06 km test distance. It indicated the extent of robustness of the system, because throughput was not being dependent on received signal quality within a certain range of antenna angles.  Due to this property, clients will not incur additional loss of throughput due to multiple clients being present at different angular distances (within a certain limit) from the single base antenna.
4.	Four radio frequency coverage heatmaps have been created with the collected received signal power (download), SNR (download) and throughput (download and upload) using MATLAB to observe the 2D spatial variation of signal quality.
5.	The results from the outdoor measurement campaign were compared with theory or standard values available in order to interpret and justify them. The measurement data were compared with free space simplified path loss model and path loss exponent has been estimated. Through curve fitting of measured path loss data, the path loss exponent was found to be 2.735 which falls within the correct theoretical range.
6.	Data collected for 24 hours from the live system at Tillman county were analyzed and the maximum download throughput was found to be 16.93 Mbps (average 16.27 Mbps), and minimum latency was found to be 32.23 ms (average 40.7 ms). The received download throughput was 70.8% of the maximum throughput that Adaptrum WSD can provide which was quite satisfactory for the rural families, especially at the outdoor environment with all the path loss, noise, multipath and lower order modulation. The upload throughput was lower (5.35 Mbps) in the live system which was attributed to the higher upload noise floor (-69 dBm) and hence lower upload SNR present in the channel at the time of data collection.

# Related publication

M. Z. Islam, J. F. O’Hara, D. Shadoan, M. Ibrahim and S. Ekin, "TV White Space Based Wireless Broadband Internet Connectivity: A Case Study With Implementation Details and Performance Analysis," in IEEE Open Journal of the Communications Society, vol. 2, pp. 2449-2462, 2021, doi: 10.1109/OJCOMS.2021.3123939.

https://ieeexplore.ieee.org/abstract/document/9593933
