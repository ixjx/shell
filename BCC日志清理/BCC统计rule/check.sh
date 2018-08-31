#!/bin/bash

#$1: config file
#$2: res file

ruleCheck(){
    workdir=$(pwd)

    rm -f $workdir/$2
    startime=`date -d today +"%Y-%m-%d-%H:%M:%S"`
    echo startime: $startime >> $workdir/$2
    echo startime: $startime

    for ip in $(cat $workdir/$1)
    do
        ssh $ip ipcli -S $ip  -N administrator -P cqccnbcc.,. < command.txt >> $workdir/$2
        echo ---------------------------------------------------------------------------------- >> $workdir/$2
    done

    donetime=`date -d today +"%Y-%m-%d-%H:%M:%S"`
    echo donetime: $donetime >> $workdir/$2
    echo donetime: $donetime
}

ruleCheck zhucheng.conf reszhucheng.txt
ruleCheck quxiancmts.conf resquxiancmts.txt
ruleCheck quxianvod.conf resquxianvod.txt

