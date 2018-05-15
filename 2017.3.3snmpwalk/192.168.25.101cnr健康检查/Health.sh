rm -rf /cnr/123
rm -rf /cnr/124
rm -rf /cnr/125
echo "-----------------------------CM DHCP Health--------------------------------------" >> /cnr/123
echo -----------------------------CM DHCP Health--------------------------------------
for ip in `cat /cnr/.source/cm-ip`
do
host=`ssh $ip hostname`
nowtime=`ssh $ip date -d today +"%Y-%m-%d-%H:%M:%S"`
ipaddr=`ssh $ip ifconfig -a|head -2|tail -1|awk '{print $2}'`
value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. dhcp gethealth|tail -1`
#echo $host "|" ip $ipaddr "|" $nowtime "|" DHCP "|" $value >> /cnr/123
#echo $host "|" ip $ipaddr "|" $nowtime "|" DHCP "|" $value 
echo $host "|" ip addr":" $ip "|" $nowtime "|" DHCP "|" $value >> /cnr/123
echo $host "|" ip addr":" $ip "|" $nowtime "|" DHCP "|" $value 
done
echo ---------------------------------------------------------------------------------- 
echo
echo "-----------------------------CPE DHCP Health--------------------------------------" >> /cnr/123
echo -----------------------------CPE DHCP Health--------------------------------------
for ip in `cat /cnr/.source/cpe-ip`
do
host=`ssh $ip hostname`
nowtime=`ssh $ip date -d today +"%Y-%m-%d-%H:%M:%S"`
ipaddr=`ssh $ip ifconfig -a|head -2|tail -1|awk '{print $2}'`
value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. dhcp gethealth|tail -1`
#echo $host "|" ip $ipaddr "|" $nowtime "|" DHCP "|" $value >> /cnr/123
#echo $host "|" ip $ipaddr "|" $nowtime "|" DHCP "|" $value 
echo $host "|" ip addr":" $ip "|" $nowtime "|" DHCP "|" $value 
echo $host "|" ip addr":" $ip "|" $nowtime "|" DHCP "|" $value >> /cnr/123
done
echo ----------------------------------------------------------------------------------
echo
echo "-------------------------------TFTP Health----------------------------------------" >> /cnr/123
echo -------------------------------TFTP Health----------------------------------------
nowtime=`date -d today +"%Y-%m-%d-%H:%M:%S"`
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33
do
        ip=`cat /cnr/.source/tftp-$i |awk '{print $1}'`
        host=`cat /cnr/.source/tftp-$i |awk '{print $2}'`
        #value=`ssh administrator@$ip cat gethealth.txt|tail -1`
        value=`ssh administrator@$ip nrcmd.bat -N admin -P cq20cnt05. tftp gethealth|tail -1`
        echo $host "|" ip addr:$ip "|" $nowtime "|" TFTP "|" $value >> /cnr/123
        echo $host "|" ip addr:$ip "|" $nowtime "|" TFTP "|" $value 
done
for i in 16 17
do
        ip=`cat /cnr/.source/tftp-$i |awk '{print $1}'`
        host=`cat /cnr/.source/tftp-$i |awk '{print $2}'`
        value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. tftp gethealth |tail -1`
        echo $host "|" ip addr:$ip "|" $nowtime "|" TFTP "|" $value >> /cnr/123
        echo $host "|" ip addr:$ip "|" $nowtime "|" TFTP "|" $value 
done
echo ---------------------------------------------------------------------------------- >>  /cnr/123
echo ---------------------------------------------------------------------------------- 
echo 
cp /cnr/123 /cnr/health_history/gethealth_cqcnt_$nowtime
sed 's/^/\<br\>/' /cnr/123 > /cnr/124
sed  's/.*/&\<\/br\>/' /cnr/124 > /cnr/125
rm -rf /usr/local/apache2/htdocs/index1.html
cp /cnr/125 /usr/local/apache2/htdocs/index1.html
