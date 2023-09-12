#!/bin/bash

userid1=$(id -u)
date=$(date +%f)
script_name=$0
logfile=/tmp/$script_name-$date.log

valid(){
    if [$1 -ne 0]
    then
       echo "$2  failed"
       exit 1
    else
       echo  "$2  success"
    fi

}

if [ $userid -ne 0 ]
then
   echo "error:please try login with sudo access that is root access to install any package"
else
   echo "your are good to go with installation"
fi

yum install git -y

valid $? "git installation

yum install mqsql -y

valid $? "mysql installation"

yum install postfix -y

valid $? "postfix installation"

