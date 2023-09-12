#!/bin/bash

date=$(date)
logfile=/home/centos/scriptlogs-$date.log
apt_dir=/home/centos/app_dir

findtodel=$(find $apt_dir -name "*.log" -type f -mtime +14)

while read line
do
echo "deleting $line" &>>$logfile
done <<< $findtodel