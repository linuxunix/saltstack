#!/bin/bash
flag=`ps -C nginx --no-header |wc -l`
if [ $flag -eq 0 ];then
        /usr/local/nginx/nginx
        sleep 3
        if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then
           killall keepalived                                                 
        fi
fi

