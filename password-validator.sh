#
# Author: Evgeni Kovalskiy
#
# This is a password validator script that runs automaticly in while loop
#
#
    # $1 = one inpurt from the user (one password)
    PASSWORD="$1"
    # while loop that runs automaticaly till your password is invalid
    while :
    do
        if [ "${#PASSWORD}" -lt "10" ]
        then
            echo -e "\e[1;31m Your password must be minimum of 10 characters.\e[0m"
            read -p "Enter your password again:" PASSWORD
        elif ! [[ $PASSWORD =~ [[:alpha:]] && $PASSWORD =~ [[:digit:]] ]]
        then
            echo -e "\e[1;31m The password must be contain Numbers and Letters\e[0m"
            read -p "Enter your password again:" PASSWORD
        elif ! [[ $PASSWORD =~ [[:upper:]] && $PASSWORD =~ [[:lower:]] ]]
        then
            echo -e "\e[1;31m The password must be include both the small and capital case letters\e[0m"
            read -p "Enter your password again:" PASSWORD
        else
            echo -e "\e[0;32m The password passed the validation.\e[0m"
            exit 0
        fi
    done






