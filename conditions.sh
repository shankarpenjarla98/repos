#!/bin/bash


userid=$(id -u)

  if[ $userid -ne 0 ]
   then
    echo "please try to use root access"
    exit 1
  #else
   # echo "Now you are good to install git "
    fi

 yum install git -y

  