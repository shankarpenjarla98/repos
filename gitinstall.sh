#!/bin/bash

userac=$(id -u)

validation(){
    if [$1 -ne 0]
    then
       echo "installation got failed"
    else
      echo  "installation got success"
    fi
}

if [$userac -ne 0]
then 
   echo "please try with root access"
else
   echo "good to go with installation"
fi

yum install git -y

