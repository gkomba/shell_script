#!/bin/bash

#variables
USERS_FILE=".users_file.txt"
ADM_FILE=".root_log_file.txt"
USER_FOUND=false

#funtions
root_home(){
    LOG=`date +%d%m%y%T`
    echo "${LOG}" >> "${ADM_FILE}" 
    echo "$ #######################"
    echo "$ ######### root ########"
    echo "$ #######################"
    echo "$ --"
    echo "$ Delete User > 1"
    echo "$ Back Home   > 2"
    echo "$ List User   > 3"
    echo "$ Upgrade && update System packages > 4"
    echo "$ Insert Mode >  5"
    echo "$ --"
    read -p "$ " OPTION_1

    if [ "${OPTION_1}" = 1 ]; then
        echo "$ Delete User"
        echo "$ Enter the user"
        read -p "$ " USER_DELETE
        if [ "$USER_DELETE" = "root" ]; then
            echo "$ This User Cannot Be Deleted"
            echo "$ Canceled"
            echo "$ Press ENTER to continue"
            read
            clear
            USER_DELETE=0
            root_home
        else
            echo "$ WARNING!!!!"
            echo "$ Are you sure you want to delete this user?(yes\no)"
            read -p "$ " OPTION_2
            if [ "${OPTION_2}" = "yes" ]; then
                echo "$ Deleting $USER_DELETE ..."
                sleep 1s
                ./user_delete $USER_DELETE
                echo "$ USER DELETED SUCCESS"
                echo "$ Press ENTER to continue"
                read
                clear
                root_home
            else
                echo "$ Canceled"
                sleep 0.10
                clear
                root_home
            fi
        fi
    elif [ "${OPTION_1}" = 2 ]; then
        echo "$ Back Home"
        sleep 0.10
        clear
        display
    elif [ "${OPTION_1}" = 3 ]; then
        sleep 0.10
        clear
        echo "$ LIST OF USERS"
        USERS_LISTED=$(cut -d':' -f1 "${USERS_FILE}")
        echo "${USERS_LISTED}"
        echo "$ Press enter to continue"
        read
        clear
        root_home
    elif [ "${OPTION_1}" = 4 ]; then
        sudo apt update
        sudo apt upgrade
        echo "Packages Updated"
        echo "Press ENTER to continue"
        read
        clear
        root_home
    elif [ "${OPTION_1}" = "exit" ]; then
        clear
        exit 0
    elif [ "${OPTION_1}" = 5 ]; then
        sh
        clear
        root_home
    else
        echo "Invalid Option"
        echo "Press ENTER to continue"
        read
        clear
        root_home
    fi
}

login(){
    if [ -f $USERS_FILE ]; then
        echo ""
    else 
        touch .users_file.txt
    fi

    echo "Back Menu -> back"
    echo "username:"
    read USER_INPUT

    if [ "${USER_INPUT}" = "back" ]; then
        clear
        display
    elif [ "{$USER_INPUT}" = "exit" ]; then
        clear
        exit
    fi
    echo "password:"
    read -s PASS_INPUT

    while IFS=: read -r USER PASS; do
        if [[ "${USER_INPUT}" == "${USER}" && "${PASS_INPUT}" == "${PASS}" ]]; then
            USER_FOUND=true
            break
        fi
    done < "${USERS_FILE}"

    if [ "${USER_FOUND}" = true ]; then
        echo "welcome "
        clear
        if [ "${USER_INPUT}" = "root" ]; then
            echo "you have successfully logged as $USER_INPUT"
            sleep 0.5s
            clear
            root_home
        else
            echo "you have successfully logged as $USER_INPUT"
            sleep 5s
            clear
            exit
        fi
    else
        clear
        echo "username or password wrong"
        sleep 0.7s
        clear
        login
    fi
}

creat_new_user() {
    if [ -f $USERS_FILE ]; then
        echo ""
    else 
        touch .users_file.txt
    fi

    echo "Back Menu -> back"
    echo "Digite o primeiro nome do novo usuário:"
    if [ "${NEW_USER_F}" = "back" ]; then
        clear
        display
    fi
    read NEW_USER_F
    echo "Digite o ulitmo nome do novo usuário:"
    read NEW_USER_L

    if grep -q "^$NEW_USER_F:" "$USERS_FILE"; then
        echo "Usuário já existe. Escolha outro nome de usuário."
        sleep 0.5s
        clear
        creat_new_user
        return
    fi

    echo "Digite a senha:"
    read -s NEW_PASS
    echo "$NEW_USER_F $NEW_USER_L:$NEW_PASS" >> "$USERS_FILE"
    echo "Usuário criado com sucesso!"
    echo "Press ENTER to continue"
    read
    clear
    display
}

display(){
echo "---------- OPTIONS -----------"
echo "----------| LOGIN |-----------"
echo "------------>> 1 <<-----------"
echo "---------| NEW USER |---------"
echo "------------>> 2 <<-----------"
echo "----------| HELP  |-----------"
echo "------------>> 3 <<-----------"
echo "----------| Exit  |-----------"
echo "------------>> 4 <<-----------"
read -p ">> " OPTIONS

if [ "${OPTIONS}" = 1 ]; then
    clear
    login
elif [ "${OPTIONS}" = 2 ]; then
    clear
    creat_new_user
elif [ "${OPTIONS}" = 3 ]; then
    sleep 0.5s
    clear
    echo "help"
elif [ "${OPTIONS}" = 4 ]; then
    echo "BYE"
    exit
else
    echo "opcao invalida"
    exit
fi
}

#program
display