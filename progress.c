/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   progress.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gkomba <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/27 11:01:40 by gkomba            #+#    #+#             */
/*   Updated: 2024/08/27 11:18:33 by gkomba           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <strings.h>

void set_point(void)
{
    printf(".");
    sleep (0.90);
    printf(".");
    sleep (1);
    printf(".");
    sleep (1.10);
    printf(".");
    sleep (1.20);
    printf(".");
    sleep (1.30);
    printf(".");
    sleep (1.4);
    printf(".");
    sleep (1.40);
    printf(".");
    sleep (1.50);
    printf(".");
    sleep (1);
    printf(".");
    sleep (1);
    printf(".");
    sleep (1);
    printf(".");
    sleep (1);
    printf(".");
    sleep (2);
    printf(".");
    sleep (1);
    printf(".");
    sleep (3);
    printf(".");
    sleep (5);
    printf(".");
    sleep (2);
    printf(".");
    sleep (5);
    printf(".");
    sleep (3);
    printf(".");
    sleep (3);
    printf(".");

}

int main(void)
{
    set_point();
    printf("\n");
    return 0;
}