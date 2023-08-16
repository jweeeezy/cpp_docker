# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert <jwillert@student.42heilbronn.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 18:42:55 by jwillert          #+#    #+#              #
#    Updated: 2023/08/16 09:55:12 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #


# General
.PHONY: all stop build run

all: build
stop:
	docker stop $(shell docker ps -a -q)
build: submodule_update
	docker build . -t cpp
run:
	docker run -it cpp
re: 
	$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY: rm rm_ps rm_images

rm:	rm_ps rm_images
rm_ps:
	docker rm $(shell docker ps -a -q)
rm_images:
	docker image rm $(shell docker images -a -q)

# Git submodules
.PHONY: submodule_init submodule_update submod

submod: submodule_init submodule_update
submodule_init:
	git submodule update --init --recursive
	git submodule foreach 'git checkout master'
submodule_update: submodule_init
	git submodule foreach 'git pull'
