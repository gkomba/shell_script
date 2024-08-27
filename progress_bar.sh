#!/bin/bash

# Função para exibir a barra de progresso
show_progress() {
    local progress_bar_length=50
    local percent=$1
    local progress=$((percent * progress_bar_length / 100))
    
    # Início da barra de progresso
    echo -n "["
    
    # Cor verde
    echo -ne "\033[0;32m"
    
    # Parte preenchida da barra de progresso
    for ((i=0; i<progress; i++)); do
        echo -n "#"
    done

    # Parte não preenchida da barra de progresso
    echo -ne "\033[0m"
    for ((i=progress; i<progress_bar_length; i++)); do
        echo -n " "
    done
    
    # Fechamento da barra de progresso e exibição do percentual
    echo -ne "] $percent% \r"
    echo -ne "\033[0m"  # Reseta a cor para o padrão
}

# Exemplo de uso
for ((i=0; i<=100; i+=2)); do
    show_progress $i
    sleep 0.1
done

# Move o cursor para a linha seguinte após a barra de progresso
echo -ne "\n"
