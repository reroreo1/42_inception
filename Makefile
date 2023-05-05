names=nginx mariadb wordpress
volumes=srcs_db srcs_wp
path=/Users/mac/Desktop/inc_final/srcs/data

all:
	mkdir -p ${path}/data-db/
	mkdir -p ${path}/data-wp/
	docker-compose -f ./srcs/Docker-compose.yaml up  --build

down:
	docker-compose -f ./srcs/Docker-compose.yaml down
clean: down
	docker volume rm ${volumes}
	rm -rf ${path}
fclean:
	rm -rf ${path}
	docker rmi ${names}
	docker system prune --all -f