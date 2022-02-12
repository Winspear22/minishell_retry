# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/12 12:08:53 by user42            #+#    #+#              #
#    Updated: 2022/02/12 12:45:50 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell
NAME_OS = $(shell uname)

ifeq ($(NAME_OS), Darwin)
        SRC = srcs/main.c srcs/get_next_line_utils.c srcs/get_next_line.c srcs/ft_free_and_errors.c
        NAME_OS = MAC
endif
ifeq ($(NAME_OS), Linux)
        SRC = srcs/*.c libft/*.c
endif

OBJ = *.o

FLAGS = -ggdb3 -std=c11 -Wall -Wextra -Werror
OBJ_FILE = ./obj_files/


LIBFT_A = libft.a
LIBFT_DOSSIER = libft/
LIBFT  = $(addprefix $(LIBFT_DOSSIER), $(LIBFT_A))

WHITE ='\033[0m'
BLUE ='\033[36m'
CYAN ='\033[1;32m'
RED = '\033[0;31m'


all: $(NAME)

$(NAME): $(OBJ)
	@echo $(CYAN) "Compilation en cours de $(NAME) crée par $(RED)fasi-moh et adaloui$(CYAN) sur l'OS \"$(NAME_OS)\"" $(WHITE)
	@make -C $(LIBFT_DOSSIER)
	@gcc  $(FLAGS)  $(LIBFT) $(OBJ) -o $(NAME) -lreadline -ggdb3 -std=c11
	@mv ${OBJ} ${OBJ_FILE}
	@echo ""
	@echo $(BLUE)"Tout a été compilé avec succès ! -"$(WHITE)

$(OBJ): $(SRC)
	@echo $(CYAN) "Creation des fichiers .o." $(WHITE)

	@gcc $(FALGS) -c -ggdb3 -std=c11 $(SRC) 

clean:
	@echo "Suppression en cours des fichiers .o de $(NAME) et de la libft"
	@echo $(CYAN) "Suppression des fichiers .o de $(NAME)." $(WHITE)
	@echo $(CYAN) "Suppression des fichiers .o de la libft." $(WHITE)
	@rm -f ./obj_files/*.o
	@make -C $(LIBFT_DOSSIER) clean
	@echo "Nettoyage des fichiers .o effectué"

fclean: clean
	@echo $(CYAN) "Suppression du logiciel $(NAME)." $(WHITE)
	@rm -rf $(NAME)
	@make -C $(LIBFT_DOSSIER) fclean
	@echo "Tout a été supprimé !"
	
re: fclean all