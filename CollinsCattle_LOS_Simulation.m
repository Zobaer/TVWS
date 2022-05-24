clc; clear; close all;

%closer cell tower
latctcloser = 34.392556;
longctcloser = -98.879167;

% far cell tower
latctfar = 34.391778;
longctfar = -98.704861;

%collin's cattle
%latcolcattle = 34.4062484;
%longcolcattle = -98.8196923;

latcolcattle = 34.406755;
longcolcattle = -98.812423;

%Create TVWS transmitter and receiver
txcloser = txsite('Name','ctcloser',"AntennaHeight",30.5,...
    'Latitude', latctcloser, 'Longitude', longctcloser,'TransmitterFrequency',602e6);
txfar = txsite('Name','ctfar',"AntennaHeight",30.5,...
    'Latitude', latctfar, 'Longitude', longctfar,'TransmitterFrequency',602e6);
rx = rxsite('Name','colcattle',"AntennaHeight",5, 'Latitude', latcolcattle, 'Longitude', longcolcattle);

show(txcloser);
show(txfar);
show(rx);
los(txcloser,rx);
los(txfar,rx);