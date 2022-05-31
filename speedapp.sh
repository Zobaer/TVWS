#!/bin/bash

filename=`date --iso-8601=date`
if [ ! -f "/home/pi/speedtestresults/$filename.csv" ]; then 
/home/pi/.local/bin/speedtest --csv-header >> /home/pi/speedtestresults/$filename.csv
fi

while true; do

if [[ "$filename" != "`date --iso-8601=date`" ]]; then

rclone copy /home/pi/speedtestresults/$filename.csv twister:TVWS/SpeedTestResults/
curl -X POST -H "Content-Type: multipart/form-data" -F "file=@/home/pi/speedtestresults/$filename.csv" http://tvws.twisteriot.com:3000/handinData
filename=`date --iso-8601=date`

if [ ! -f "/home/pi/speedtestresults/$filename.csv" ]; then
/home/pi/.local/bin/speedtest --csv-header >> /home/pi/speedtestresults/$filename.csv
fi

fi

/home/pi/.local/bin/speedtest --csv >> /home/pi/speedtestresults/$filename.csv
sleep 5m

done

