#!/bin/bash


userid=$(id -u)

validate()

{


    if [ $1 -ne 0]

    then
       echo "git installation is failed"

    else
       echo "installation is success"

}


if [ $userid -ne 0 ]

then
    echo "please run this script with root access"
    
  #else
   # echo "Now you are good to install git "
fi

yum mysql git -y

validate $? "Git installation"

  