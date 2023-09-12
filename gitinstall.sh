#!/bin/bash

userac=$(id -u)
date=$(date +%F)
scriptfile=$0
logfile1=/tmp/$scriptfile-$date.log
r="/e[31m"
g="/e[32m"

validation(){
    if [ $1 -ne 0 ]
    then
       echo "  $r$2  installation got failed"
       exit 1
    else
      echo  " $g$2 installation got success"
    fi
}

if [ $userac -ne 0 ]
then 
   echo "please try with root access"
else
   echo "good to go with installation"
fi

yum install git -y &>>$logfile1

validation $? "git"  

yum install postfix -y &>>$logfile1

validation $? "postfix" 
