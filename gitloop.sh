#!/bin/bash

for i $@
do
yum install $i -y
done