#!/usr/bin/env bash
#  This script for ubuntu machine only:)
function useradd() {
    echo "useradd oparetion"
    read -p "Enter username : " username
    id "$username" &> /dev/null
    if [[ $? -eq 0 ]]; then
       echo "$username already exists!"
    else
      sudo useradd $username
      [[ $? -eq 0 ]] && echo "$username successfully!" || echo "user add failed!"
    fi
    loop
}

function update-passwd() {
    echo "update password oparetion"
    read -p "Enter username : " username
    read -sp "Enter userpass : " userpass
    echo ""
    id "$userpass" &> /dev/null
    if [[ $? -eq 0 ]]; then
       echo $username:$userpass | sudo chpasswd
       [[ $? -eq 0 ]] && echo "$username user password update successfully!" || echo "update password failed!"
    else
       echo "$userpass does not exists!"
    fi
    loop
}

function delete-user() {
    echo "user delete oparetion"
    read -p "Enter username : " userdelete
    id "$userdelete" &> /dev/null
    if [[ $? -eq 0 ]]; then
       sudo userdel $userdelete
       [[ $? -eq 0 ]] && echo "$userdelete user delete successfully!" || echo "user delete failed!"
    else
       echo "$userdelete does not exists!"
    fi
    loop

}

function loop() {
    echo "useradd         = 0"
    echo "update-password = 1"
    echo "user-delete     = 2"
    echo "exit            = 3"
    read -p "Which one is your choose :" choose
}   
function choose() {  
    loop 
    case $choose in
       0) useradd ;;
       1) update-passwd ;;
       2) delete-user ;;
       3) exit ;;
       *) echo "$choose is not valid - try again" && loop
    esac
}
choose
