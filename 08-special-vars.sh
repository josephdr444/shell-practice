#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script Name: $0"
echo "Current Directory: $PWD"
echo "who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of the Script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"

