#!/bin/bash

#variables
USERS_FILE="users_file.txt"
USER_FOUND=false

#funtions
login(){
    echo "username:"
    read USER_INPUT
    echo "password:"
    read -s PASS_INPUT

    while IFS=: read -r USER PASS; do
        if [[ "${USER_INPUT}" == "${USER}" && "${PASS_INPUT}" == "${PASS}" ]]; then
            USER_FOUND=true
            break
        fi
    done < "${USERS_FILE}"

    if [ "${USER_FOUND}" = true ]; then
        echo "welcome"
    else
        echo "username or password wrong"
    fi
}

creat_new_user() {
    echo "Digite o novo nome de usuário:"
    read NEW_USER

    if grep -q "^$NEW_USER:" "$USERS_FILE"; then
        echo "Usuário já existe. Escolha outro nome de usuário."
        creat_new_user
        return
    fi
    echo "Digite a senha:"
    read -s NEW_PASS
    echo "$NEW_USER:$NEW_PASS" >> "$USERS_FILE"
    echo "Usuário criado com sucesso!"
}


echo "---------- OPTIONS -----------"
echo "----------| LOGIN |-----------"
echo "------------>> 1 <<-----------"
echo "---------| NEW USER |---------"
echo "------------>> 2 <<-----------"
echo "----------| HELP  |-----------"
echo "------------>> 3 <<-----------"
read -p ">> " OPTIONS

if [ $OPTIONS = 1 ]; then
    login
elif [ $OPTIONS = 2 ]; then
    creat_new_user
elif [ $OPTIONS = 3]; then
    echo "help"
else
    echo "opcao invalida"
fi