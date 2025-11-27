#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"     # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER 
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1  # failure is other than 0
fi



VAIDATE(){  # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
        echo -e " Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
         echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
} 

dnf list installed mysql &>>LOG_FILE   
# install if it is not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>LOG_FILE
    VALIDATE $? "MYSQL"    # here $1 is $? and $2 is MYSQL
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installled nginx &>>LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>LOG_FILE
    VALIDATE $? "Nginx" 
else 
    echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>LOG_FILE
    VAIDATE $? "python3"
else 
    echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

    # functions do some task we need to pass inputs it will give us outputs 
     
     # &>>LOG_FILE where ever the output we get too much we redirect it to this file 





