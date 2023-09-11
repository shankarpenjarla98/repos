#!/bin/bash


userid=$(id -u)

if [ $userid -ne 0 ]

then
    echo "please run this script with root access"
    
  #else
   # echo "Now you are good to install git "
fi

yum install git -y

  