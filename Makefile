# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fpeixoto <fpeixoto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/27 20:14:50 by fpeixoto          #+#    #+#              #
#    Updated: 2022/10/13 19:40:55 by fpeixoto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

NAME = minitalk

CLIENT    = client
SERVER    = server
CLIENT_BONUS	= client_bonus
SERVER_BONUS	= server_bonus

SRC_C = client.c
SRC_S = server.c
SRC_C_B	= client_bonus.c 
SRC_S_B = server_bonus.c

all: $(CLIENT) $(SERVER) 

bonus:	$(CLIENT_BONUS) $(SERVER_BONUS)

$(NAME): all

$(CLIENT): 
	$(CC) $(CFLAGS) $(SRC_C) -o $(CLIENT)

$(SERVER): 
	$(CC) $(CFLAGS) $(SRC_S)  -o $(SERVER)

$(CLIENT_BONUS):
	$(CC) $(CFLAGS) $(SRC_C_B) -o $(CLIENT_BONUS)

$(SERVER_BONUS):
	$(CC) $(CFLAGS) $(SRC_S_B) -o $(SERVER_BONUS)
	
clean:
	$(RM) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)

fclean: clean
	$(RM) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)

re: fclean $(NAME)

rebonus: fclean $(CLIENT_BONUS) $(SERVER_BONUS)

.PHONY: all clean fclean re bonus
