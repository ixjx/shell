rm -f res.txt
startime=`date -d today +"%Y-%m-%d-%H:%M:%S"`
echo startime: $startime >> /root/test/res.txt
echo startime: $startime


for ip in `cat /root/test/cpe-ip.txt`
do
        host=$ip
        value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. report | grep 0.0.0.0 | awk '{print $6}'`
        echo $host "|" DHCP leased "|" $value >> /root/test/res.txt
        echo $host "|" DHCP leased "|" $value
done

echo ----------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------- >> /root/test/res.txt

for ip in `cat /root/test/cm-ip.txt`
do
	host=$ip
	value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. report | grep 0.0.0.0 | awk '{print $6}'`
	echo $host "|" DHCP leased "|" $value >> /root/test/res.txt
	echo $host "|" DHCP leased "|" $value
done

echo ----------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------- >> /root/test/res.txt

for ip in `cat /root/test/quxiancpe-ip.txt`
do
        host=$ip
        value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. report | grep 0.0.0.0 | awk '{print $6}'`
        echo $host "|" DHCP leased "|" $value >> /root/test/res.txt
        echo $host "|" DHCP leased "|" $value
done

echo ----------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------- >> /root/test/res.txt

for ip in `cat /root/test/quxiancm-ip.txt`
do
        host=$ip
        value=`ssh $ip /cnr/nwreg2/local/usrbin/nrcmd -N admin -P cq20cnt05. report | grep 0.0.0.0 | awk '{print $6}'`
        echo $host "|" DHCP leased "|" $value >> /root/test/res.txt
        echo $host "|" DHCP leased "|" $value
done


donetime=`date -d today +"%Y-%m-%d-%H:%M:%S"`
echo donetime: $donetime >> /root/test/res.txt
echo donetime: $donetime
