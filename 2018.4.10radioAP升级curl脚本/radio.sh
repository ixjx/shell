#!/bin/bash
file="/home/xjx/Desktop/RDW96E.88ER.20180330.CQ_L2GRE.bin"
auth="190831:190831"

for ip in `cat /home/xjx/Desktop/ip.txt`
do
  res=`curl -F "send=butinfo.upload" -F "filename=@${file}" ${ip}/boafrm/formUpload -u ${auth} --connect-timeout 5 -m 10 -L`
  #redirect to http://$ip/countDownPage.htm
done

echo "last:${ip} finished!"



# curl -v -F "send=butinfo.upload" -F "filename=@/home/xjx/Desktop/RDW96E.88ER.20180330.CQ_L2GRE.bin" 10.64.158.162/boafrm/formUpload -u 190831:190831 --connect-timeout 5 -L
