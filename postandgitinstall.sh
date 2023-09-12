#!/bin/bash

date=$(date +%f)
logfile=/scriptlogs/$date.log
userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
    echo "$R $2 not yet installed need to installed $N"
    else
    echo "$G $2 installed successfully $N"
    fi

}

if [ $userid -ne 0]
then
   echo "$R ERROR:PLEASE TRY TO DO WITH ROOT ACCESS $N"
  exit 1
else
   echo "$Y NOW YOUR IN ROOT ACCESS"
fi

for i in $@
do
yum list installed $i
if [ $? -ne 0]
then
  echo "$R not yet installed need to install $N"
yum install $i -y
validate $? "$1"
else
  echo "$i as already installed"
fi
done