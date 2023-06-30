all:
	bash -c "cd ./srcs/app; npm install"
	bash -c "sudo docker compose build"
	bash -c "sudo docker compose up -d"
clean:
	bash -c "sudo docker compose down"
networks:
	bash -c "sudo docker network ls"
volumes:
	bash -c "sudo docker volume ls"
fclean: clean
	bash -c "sudo docker image prune --force; sudo docker image rm adminer:v1 nginx:v1 wordpress:v1 mariadb:v1 redis:v1 vsftpd:v1 nest:v1"
delete_volumes:
	bash -c "sudo docker volume rm www-data data adminer-file"
images:
	bash -c "sudo docker images"
logs:
	bash -c "sudo docker compose logs"