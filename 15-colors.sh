$!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1  # failure is other than 0
fi


VAIDATE(){  # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
        echo -e " Installing $2 ... $R failure $N"
        exit 1
    else
         echo -e "Installing $2 ... $G SUCCESS $N"
    fi
} 

dnf list installed mysql 
# install if it is not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y 
    VALIDATE $? "MYSQL"    # here $1 is $? and $2 is MYSQL
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi

dnf list installled nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "Nginx" 
else 
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y 
    VAIDATE $? "python3"
else 
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi

    # functions do some task we need to pass inputs it will give us outputs 
     


