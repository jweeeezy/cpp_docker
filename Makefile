# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert@student.42heilbronn.de            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 18:42:55 by jwillert          #+#    #+#              #
#    Updated: 2023/07/10 18:49:20 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #

.PHONY: all stop rm build

all: stop rm build run
stop:
	docker stop $(docker ps -a -q)
rm:
	docker rm $(docker ps -a -q)
	docker image rm $(docker images -a -q)
build:
	docker build . -t cpp
run:
	docker run -it cpp
