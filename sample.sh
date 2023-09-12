#!/bin/bash

date=$(date +%F)
logdir=/home/centos/scriptlogs
accessid=$(id -u)
logfile=$logdir-$date.log

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"


if [ $accessid -ne 0 ]
then
echo -e "$r error please try to install with root access $n "
exit 1
else
echo -e "$y now you good to go for installation $n "
fi

validate(){
    if [$1 -ne 0 ]
    then
    echo -e " $r $2 installation got failed $n"
    exit 1
    else
    echo -e "$g $2 installation got success $n"
    fi

}



for i in $@
do
yum list installed $i &>>$logfile
if [ $? -ne 0 ]
then
echo -e "$i not installed let's install it"
yum install $i -y  &>>$logfile
validate $? "$i"
else
echo -e "$y is already installed $n"
fi
done