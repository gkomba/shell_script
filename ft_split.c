/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gkomba <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/18 20:25:44 by gkomba            #+#    #+#             */
/*   Updated: 2024/08/27 12:44:55 by gkomba           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static char	**free_split(char **split, size_t word)
{
	while (word > 0)
	{
		free(split[word]);
		word--;
	}
	free(split);
	return (0);
}

static size_t	ft_count(const char *s, char c)
{
	size_t	num_palavras;
	size_t	i;

	num_palavras = 0;
	i = 0;
	while (s[i])
	{
		if (s[i] != c)
		{
			num_palavras++;
			while (s[i] && s[i] != c)
				i++;
		}
		else
			i++;
	}
	return (num_palavras);
}

static char	*ft_strcpy(char *dest, const char *s, size_t i, size_t word_len)
{
	size_t	j;

	j = 0;
	while (word_len > 0)
	{
		dest[j] = s[i - word_len];
		j++;
		word_len--;
	}
	dest[j] = '\0';
	return (dest);
}

static char	**ft_alloc(const char *s, char c, char **split, size_t num_word)
{
	size_t	i;
	size_t	word;
	size_t	word_len;

	i = 0;
	word = 0;
	word_len = 0;
	while (word < num_word)
	{
		while (s[i] && s[i] == c)
			i++;
		while (s[i] && s[i] != c)
		{
			i++;
			word_len++;
		}
		split[word] = (char *)malloc(sizeof(char) * (word_len + 1));
		if (!split)
			return (free_split(split, word));
		ft_strcpy(split[word], s, i, word_len);
		word_len = 0;
		word++;
	}
	split[word] = 0;
	return (split);
}

char	**ft_split(const char *s, char c)
{
	char		**split;
	size_t		num_palavras;

	if (!s)
		return (0);
	num_palavras = ft_count(s, c);
	split = (char **)malloc(sizeof(char *) * (num_palavras + 1));
	if (!split)
		return (0);
	split = ft_alloc(s, c, split, num_palavras);
	return (split);
}



7 *1 <-
8 *2
9 *3
0 *4
3 *5
NULL 

i = 0
while (ls != NULL && i <= 3)
{
	ls-> = ls->next;
	i++;
}