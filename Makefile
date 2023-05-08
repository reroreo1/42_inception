names=nginx mariadb wordpress
volumes=srcs_db srcs_wp
path=/home/rezzahra/data

all:
	mkdir -p ${path}/data-db/
	mkdir -p ${path}/data-wp/
	docker compose -f ./srcs/docker-compose.yaml up  --build

down:
	docker compose -f ./srcs/docker-compose.yaml down
clean: down
	docker volume rm ${volumes}
	rm -rf ${path}
fclean:
	rm -rf ${path}
	docker rmi ${names}
	docker system prune --all -f