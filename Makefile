NAME=inception
VOLUMES_DIR=/home/najacque/data
DOCKER_COMPOSE=docker-compose
COMPOSE_FILE=srcs/docker-compose.yml

$(NAME): build up

all: $(NAME)

build: 
	[ -f srcs/.env ] || (echo 'missing .env file' && exit 1)
	sudo sh -c "echo '127.0.0.1	najacque.42.fr' >> /etc/hosts"
	sudo sh -c "echo '127.0.0.1	www.najacque.42.fr' >> /etc/hosts"
	mkdir -p ${VOLUMES_DIR}/db ${VOLUMES_DIR}/wordpress
	${DOCKER_COMPOSE} -f ${COMPOSE_FILE} build

up:
	${DOCKER_COMPOSE} -f ${COMPOSE_FILE} up -d

down:
	${DOCKER_COMPOSE} -f ${COMPOSE_FILE} down

re: clean
	mkdir -p ${VOLUMES_DIR}/db ${VOLUMES_DIR}/wordpress
	${DOCKER_COMPOSE} -f ${COMPOSE_FILE} build --no-cache
	${DOCKER_COMPOSE} -f ${COMPOSE_FILE} up -d

clean: down
	sudo rm -rf ${VOLUMES_DIR}/db
	sudo rm -rf ${VOLUMES_DIR}/wordpress
	bash scripts/docker_cleanup

.PHONY: all build up down re clean 
