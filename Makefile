# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llee <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/12 13:45:45 by llee              #+#    #+#              #
#    Updated: 2019/01/28 16:45:07 by llee             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# name of executable
NAME = wolf

# compiler
CC = gcc
FLAGS = -Wall -Wextra -Werror -g

# sources, objects, and header
SRCS = ./srcs/main.c
OBJS = ./objs/main.o
SRCDIR = ./srcs/
OBJDIR = ./objs/
INCDIR = ./includes/

# libft library
LIBFT = ./libft/
LIBFT_L = -L./libft -l ft
LIBFT_I = -I./libft/libft.h

# minilibx library
MLX = ./minilibx/
MLX_L = -L./minilibx -l mlx -framework OpenGL -framework AppKit
MLX_I = -I./minilibx/mlx.h

all: obj $(LIBFT_L) $(MLX_L) $(NAME)

obj:
	mkdir -p $(OBJDIR)

$(OBJDIR)%.o:$(SRCDIR)%.c
	$(CC) $(FLAGS) $(LIBFT_I) $(MLX_I) -I $(INCDIR) -o $@ -c $<

$(LIBFT_L):
	make -C $(LIBFT)
	make clean -C $(LIBFT)

$(MLX_L):
	make -C $(MLX)

$(NAME): $(OBJS)
	$(CC) $(FLAGS) -o $(NAME) $(LIBFT_L) $(MLX_L) $(SRCS) -lpthread

clean: 
	rm -rf $(OBJDIR)
	make clean -C $(LIBFT)
	make clean -C $(MLX)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBFT)

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re lite
