# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmaluh <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/06 14:43:13 by tmaluh            #+#    #+#              #
#    Updated: 2019/03/09 13:23:08 by tmaluh           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	ECHO = echo -e
endif
ifeq ($(UNAME_S),Darwin)
	ECHO = echo
endif

LC = ar rcs
CC = gcc -march=native
CFLAGS = -Wall -Wextra -Werror -Ofast

SRC = srcs/ft_printf.c

OBJ = $(SRC:.c=.o)

LIBFT = libft/libft.a
LMAKE = make -C libft

WHITE=\033[0m
BGREEN=\033[42m
GREEN=\033[32m
RED=\033[31m
INVERT=\033[7m

DEL = rm -rf

all: $(NAME)

$(OBJ): %.o: %.c
	@$(ECHO) -n ' $@: '
	@$(CC) -c $(CFLAGS) $< -o $@
	@$(ECHO) "[$(GREEN)✓$(WHITE)]"

$(LIBFT):
	@$(LMAKE)

$(NAME): $(LIBFT) $(OBJ)
	@$(ECHO) -n '\_______,-<=-=> ./$(NAME): '
	@$(LC) $(NAME) $(OBJ)
	@$(ECHO) "$(INVERT)[$(GREEN)✓$(WHITE)$(INVERT)]$(WHITE)"

del:
	@$(DEL) $(OBJ)

clean:
	@$(DEL) $(OBJ)
	@$(LMAKE) clean

fclean: clean
	@$(LMAKE) fclean
	@$(DEL) $(NAME)
	@$(ECHO) "$(RED)deleted$(WHITE): ./$(NAME)"

re: fclean all

.PHONY: all fclean clean re