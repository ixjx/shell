#!/bin/bash

#指定日期(7天前)
DATE=`date -d "1 week ago" +%Y.%m.%d`

#当前日期
time=`date`

#删除7天前的日志
curl -XDELETE http://127.0.0.1:9200/*-${DATE}

if [ $? -eq 0 ];then
    echo $time"-->del $DATE log success.." >> /tmp/es-index-clear.log
else
    echo $time"-->del $DATE log fail.." >> /tmp/es-index-clear.log
fi
