#!/bin/bash
 
 userid=$(id -u)

 validate(){
    if [$1 -ne 0]
    then 
       echo "installation unsuccesfull"
       exit 1
    else 
       echo "Installation success"
       fi
 }

  if [$userid -ne 0]
  then 
    echo "Error:please access with root"
    else
    echo "you can install mqsql"
    fi

    yum install mysql -y

    validate $? "mysql installation"

    yum install postfix -y 

    validate $? "postfix istallation"