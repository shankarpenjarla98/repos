#!/bin/bash

uid=$(id -u)
date=$(date)
scriptname=$0
logfiles=/home/centos/scriptlogs-$date-$scriptname.log
Red="\e[31m"
Green="\e[32m"
Nor="\e[0m"
Yell="\e[33m"

if [ $uid -ne 0 ]
then
   echo -e "$Red Error:-Please try with root access$Nor"
   exit 1
else
   echo -e "$Yell Your in the root access$Nor"
fi

validations(){
    if [$1 -ne 0 ]
    then
       echo "$2 $Red installation unsuccesfull $Nor"
    exit 1
    else
       echo "$2 $Green installation done successfull $Nor"
}

for i in $@
do
yum list installed $i
if [ $? -ne 0 ]
then
   echo -e " $Yell $i not installed yet need to install $Nor"
yum install $i -y &>>$logfiles
validations $? "$i"
else
   echo  -e " $Green $i already installed $Nor"
fi
done 

