NAME=inception
VOLUMES_DIR=/home/najacque/data

$(NAME): build up

all: $(NAME)

build: 
	#echo "127.0.0.1 najacque.42.fr" >> /etc/hosts
	mkdir -p ${VOLUMES_DIR}/db ${VOLUMES_DIR}/wordpress
	docker compose build

up:
	docker compose up

down:
	docker compose down

re: clean 
	docker compose build --no-cache

clean:
	rm -rf ${VOLUMES_DIR}/wordpress/*
	rm -rf ${VOLUMES_DIR}/db/*

.PHONY: all build up down re clean
