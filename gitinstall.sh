#!/bin/bash

userac=$(id -u)
date=$(date +%F)
scriptfile=$0
logfile1=/tmp/$scriptfile-$date.log

validation(){
    if [ $1 -ne 0 ]
    then
       echo " $2 installation got failed"
       exit 1
    else
      echo  " $2 installation got success"
    fi
}

if [ $userac -ne 0 ]
then 
   echo "please try with root access"
else
   echo "good to go with installation"
fi

yum install git -y

validation $? "git" &>>$logfile1 

yum install postfix -y 

validation $? "postfix" &>>$logfile1



