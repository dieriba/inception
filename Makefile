all:	
	bash -c "sudo docker compose build"
	bash -c "sudo docker compose up -d"
clean:
	bash -c "sudo docker compose down"
networks:
	bash -c "sudo docker network ls"
volumes:
	bash -c "sudo docker volume ls"
fclean: clean
	bash -c "sudo docker image prune --force; sudo docker image rm nginx-image:v1 wordpress-image:v1 mariadb-image:v1 redis-image:v1 vsftpd-image:v1"
delete_volumes:
	bash -c "sudo docker volume rm inception_www-data inception_data inception_redis-sock"
images:
	bash -c "sudo docker images"
logs:
	bash -c "sudo docker compose logs"