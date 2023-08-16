# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert <jwillert@student.42heilbronn.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 18:42:55 by jwillert          #+#    #+#              #
#    Updated: 2023/08/16 16:57:26 by jwillert         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# General
.PHONY: 	all daemon stop build run

all: 		daemon build

daemon:
				docker info || (open -a Docker && sleep 20)
stop:
				docker stop $(shell docker ps -a -q)
build:		submod_update
				docker build . -t cpp
run:
				docker run -it cpp
re:
	$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY:		clean fclean rm rm_ps rm_images
clean: 		rm_ps
fclean:		rm_images
rm:			rm_ps rm_images
rm_ps:
				docker rm $(shell docker ps -a -q)
rm_images:
				docker image rm $(shell docker images -a -q)

# Git submodules
.PHONY: 	submod_init submod_update submod

submod: 	submod_init submod_update
submod_init:
				git submodule update --init --recursive
				git submodule foreach 'git checkout master'
submod_update: submod_init
				git submodule foreach 'git pull'
