15 * * * * cd /usr/local/lib/ipcmdr/data/svclog_archives/; for i in /usr/local/lib/ipcmdr/data/svclog_archives/*.log;  do gzip $i; rm -f $i ; done
20 * * * * find /usr/local/lib/*cmdr/data/svclog_archives/ -mtime +3 -type f -exec rm -f {} \;
30 4 * * * find /usr/local/lib/ipcmdr/data/archive/ -mtime +90 -type f -exec rm -f {} \;
40 4 * * * find /usr/local/lib/*cmdr/data/backup/*  -maxdepth 0 -type d -mtime +2 -exec  rm -rf {} \;