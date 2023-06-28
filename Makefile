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
	bash -c "sudo docker image prune --force; sudo docker image rm adminer nginx wordpress mariadb redis vsftpd"
delete_volumes:
	bash -c "sudo docker volume rm www-data data adminer-file"
images:
	bash -c "sudo docker images"
logs:
	bash -c "sudo docker compose logs"