#!/bin/bash

userac=$(id -u)
date=$(date +%F)
scriptfile=$0
logfile1=/tmp/$scriptfile-$date.log
r="\e[31m"
g="\e[32m"
n="\e[0m"

validation(){
    if [ $1 -ne 0 ]
    then
       echo  -e " $2  $r installation got failed $n"
       exit 1
    else
      echo   -e " $2  $g installation got success $n"
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
