#!/bin/bash

echo "-------------------------"
echo "DELETING A USER"
echo "-------------------------"
echo
echo
echo "List of active users:"
users
while :
do
    echo "Which user to delete?"
    read user
    if [ $user != 'root' ]
    then
        break
    else
        echo "Don't be silly..."
    fi
done

read -p "Deleting active user will leave the system to an inconsistent state. Are you sure? (y/n) " yes_no

if [ $yes_no == 'y' ]
then
    sudo userdel -rf $user
fi
exit
