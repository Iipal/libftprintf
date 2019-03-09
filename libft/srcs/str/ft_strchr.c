/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tmaluh <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/24 16:37:20 by tmaluh            #+#    #+#             */
/*   Updated: 2018/10/26 19:29:52 by tmaluh           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/lft_str.h"

string	ft_strchr(cstring s, int c)
{
	while (*s != (char)c)
		if (!*s++)
			return (0);
	return ((string)s);
}