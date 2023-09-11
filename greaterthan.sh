#!/bin/bash

 num1=$1

  if[ $1 -gt 10 ]
  then
     echo "$1 is greater than 10"
     exit 1
  else
     echo "$1 is not greater than 10"
   fi