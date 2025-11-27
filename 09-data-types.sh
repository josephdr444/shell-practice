#!/bin/bash

# everything in shell is considered as String 
NUMBER1=100
NUMBER2=200
Name=Devops

SUM=$(($NUMBER1+$NUMBER2+$Name))

echo "SUM is: ${SUM}"

# Size = 4, Max Index = 3

LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${LEADERS}[$@]}"
echo "All leaders: ${LEADERS}[$0]}"

