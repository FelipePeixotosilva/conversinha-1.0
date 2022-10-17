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

OBJS = $(SRC_C:.c=.o) $(SRC_S:.c=.o)
OBJS_BONUS = $(SRC_C_B:.c=.o) $(SRC_S_B:.c=.o)

all: $(CLIENT) $(SERVER) 

bonus:	$(CLIENT_BONUS) $(SERVER_BONUS)

$(NAME): all

$(CLIENT): $(OBJS)
	$(CC) $(CFLAGS) $(SRC_C) -o $(CLIENT)

$(SERVER): $(OBJS)
	$(CC) $(CFLAGS) $(SRC_S)  -o $(SERVER)

$(CLIENT_BONUS):
	$(CC) $(CFLAGS) $(SRC_C_B) -o $(CLIENT_BONUS)

$(SERVER_BONUS):
	$(CC) $(CFLAGS) $(SRC_S_B) -o $(SERVER_BONUS)
	
clean:
	$(RM) $(OBJS) $(OBJS_BONUS) 

fclean: clean
	$(RM) $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS)

re: fclean $(NAME) $(CLIENT_BONUS) $(SERVER_BONUS)

.PHONY: all clean fclean re bonus
