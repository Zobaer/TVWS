from datetime import datetime
import speedtest

servers = []
# If you want to test against a specific server
# servers = [1234]

threads = 1
# If you want to use a single threaded test
# threads = 1
while(1):
    print('connecting ...')
    s = speedtest.Speedtest()
    s.get_servers(servers)
    s.get_best_server()
    s.download(threads=threads)
    s.upload(threads=threads)
    s.results.share()
    print("done")
    results_dict = s.results.dict()
    dateTimeObj = datetime.now()
    dateTimeObj=dateTimeObj.strftime("%d-%b-%Y (%H:%M:%S.%f)")
    print(dateTimeObj+'    download',round(results_dict['download']/1024/1024,2),'Mb/s',
          '    upload', round(results_dict['upload']/1024/1024,2),'Mb/s',
          '    ping', round(results_dict['ping'],2),'msec \n')
    f1=open('/home/pi/speedtestresults','a+')
    f1.write(dateTimeObj+'    download  '+str(round(results_dict['download']/1024/1024,2))+' Mb/s'+
          '    upload  '+ str(round(results_dict['upload']/1024/1024,2))+' Mb/s'+
          '    ping  '+ str(round(results_dict['ping'],2))+' msec \n')
    