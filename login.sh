#!/bin/bash

case ${1,,} in
	gkomba | root)
		echo "welcome BOSS!"
		;;
	help)
		echo "Enter your username!"
		;;
	*)
		echo "Hello there. Enter a valid username"
esac

#!/bin/bash

# Define o caminho para o arquivo de usuários
USERS_FILE="usuarios.txt"

# Solicita o nome de usuário e a senha para verificação
echo "Digite o nome de usuário:"
read input_user
echo "Digite a senha:"
read -s input_pass

# Variável para armazenar o resultado da verificação
user_found=false

# Ler o arquivo de usuários linha por linha
while IFS=: read -r usuario senha; do
    if [[ "$usuario" == "$input_user" && "$senha" == "$input_pass" ]]; then
        user_found=true
        break
    fi
done < "$USERS_FILE"

# Verifica se o usuário e a senha correspondem a uma entrada no arquivo
if [ "$user_found" = true ]; then
    echo "Login bem-sucedido!"
else
    echo "Nome de usuário ou senha incorretos."
fi


USERS_FILE="users_file.txt"
USER_FOUND=false

#funtions
login(){
    echo "username:"
    read USER_INPUT
    echo "password"
    read -s PASS_INPUT

    while IFS=: read -r USER PASS; do
        if [[ ${USER_INPUT}  == ${USER} && ${PASS_INPUT} == {PASS} ]]; then
            USER_FOUND=true
            break
        fi
    done < ${USERS_FILE}

if [ ${USER_FOUND} = true ]; then
    echo "welcome"
else
    echo "usarname or password wrong"
    echo "create a new user?(y/n)"
    read CHOISE_USER
    echo "back to menu"
    read CHOISE_MENU
    if [[ ${CHOISE_USER} = y]]
        creat_new_user
    else
        
}