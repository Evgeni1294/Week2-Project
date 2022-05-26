#
# Author: Evgeni Kovalskiy
#
# This is a password validator with extra feature that checks password from a file 
# or from string  - you can run the script in those ways:
# 1. ./password-validator.sh -f "password.txt"
# 2. ./password-validator.sh "<your_password>"

# function with all the code that validate the password
function password_validator() {
        PASSWORD="$1"
        #while loop that runs automaticaly till your password is invalid
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
}

while getopts 'f:' OPTION; do #check if get -f
  case "$OPTION" in
    f) # if the case is -f
        if [ $# == 2 ] && [ $1 "$2" ] # check if the script gets 2 arguments and if the the path is a file [-f 'password.txt'] => (true)
        then
            password_from_text_file=`cat $2`  # cat - reads the content from the txt file
            password_validator "$password_from_text_file" # goes the the password_validator function
        elif [ $# == 2 ] # if the path is not a file it will print the error message
        then
            echo -e "\e[1;31m The $2 is not a file or doesn't exist.\e[0m"
            exit 1
        else
            echo -e "\e[1;31m Must get 2 arguments\e[0m"
            exit 1
        fi
        ;;
    *) # else latter 
      echo -e "\e[1;31m Illegal action\e[0m"
      exit 1
      ;;
  esac
done

if [ $# == 1 ]
then
    password_validator "$1" # if you get here it's means that you check password from string and not from a file and goes to the password_validator() function
fi










    

    

   









