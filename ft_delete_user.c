/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_delete_user.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gkomba <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/27 09:32:01 by gkomba            #+#    #+#             */
/*   Updated: 2024/08/27 10:03:55 by gkomba           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ft_split.c"

char **ft_delete_user(const char *name)
{
    int fd;
    char *file;
    char **matriz;
    ssize_t bytes_read;
    int i, j, k;
    size_t buffer_size = 10000;

    fd = open(".users_file.txt", O_RDONLY);
    if (fd == -1)
    {
        perror("open error");
        exit(EXIT_FAILURE);
    }
    file = (char *)malloc(buffer_size);
    if (!file)
    {
        perror("malloc error");
        close(fd);
        exit(EXIT_FAILURE);
    }
    bytes_read = read(fd, file, buffer_size - 1);
    if (bytes_read < 0)
    {
        perror("read error");
        free(file);
        close(fd);
        exit(EXIT_FAILURE);
    }
    file[bytes_read] = '\0';
    close(fd);
    matriz = ft_split(file, '\n');
    free(file);
    if (!matriz)
    {
        perror("ft_split error");
        exit(EXIT_FAILURE);
    }
    for (i = 0; matriz[i]; ++i)
    {
        if (strncmp(name, matriz[i], strlen(name)) == 0)
        {
            free(matriz[i]);
            j = i;
            while (matriz[j])
            {
                matriz[j] = matriz[j + 1];
                j++;
            }
            break ;
        }
    }
    return matriz;
}

int main(int argc, char **argv)
{
    char **matrix;
    int i;
    FILE *file;

    if (argc < 2)
    {
        fprintf(stderr, "Uso: %s <nome>\n", argv[0]);
        return 1;
    }
    matrix = ft_delete_user(argv[1]);
    if (!matrix)
    {
        fprintf(stderr, "Erro ao deletar usuário\n");
        return 1;
    }
    file = fopen(".users_file.txt", "w");
    if (!file)
    {
        perror("Eroor opening the file");
        return (1);
    }
    i = 0;
    while (matrix[i])
    {
        //printf("%s\n", matrix[i]);
        fprintf(file, "%s\n", matrix[i]);
        i++;
    }
    fclose(file);
    i = 0;
    while (matrix[i])
    {
        free(matrix[i]);
        i++;
    }
    free(matrix);
    printf("1\n");
    return 0;
}