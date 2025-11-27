$!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1  # failure is other than 0
fi


VAIDATE(){  # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
         echo "Installing $2 is SUCCESS"
    fi
} 


dnf install mysql -y 
VALIDATE $? "MYSQL"    # here $1 is $? and $2 is MYSQL


dnf install nginx -y 
VALIDATE $? "Nginx" 

dnf install python3 -y 
VAIDATE $? "python3"

    # functions do some task we need to pass inputs it will give us outputs 
     


