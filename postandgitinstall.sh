#!/bin/bash

date=$(date +%f)

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
    echo -e "$R $2 not yet installed need to installed $N"
    exit 1
    else
    echo -e "$G $2 installed successfully $N"
    fi

}

if [ $userid -ne 0]
then
echo -e "$R ERROR:PLEASE TRY TO DO WITH ROOT ACCESS $N"
exit 1
else
echo -e "$Y NOW YOUR IN ROOT ACCESS $N"
fi

for i in $@
do
yum list installed $i 
if [ $? -ne 0 ]
then
echo -e "$R $1 not yet installed need to install $N"
yum install $i -y 
validate $? "$i"
else
  echo -e  "$i as already installed $N"
fi
done