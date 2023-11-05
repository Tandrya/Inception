all		:	build
			sudo mkdir -p /home/mlaval/data
			sudo mkdir -p /home/mlaval/data/wordpress
			sudo mkdir -p /home/mlaval/data/database
			sudo chmod 777 /etc/hosts
			sudo chmod 777 /home
			sudo echo "127.0.0.1 mlaval.42.fr" >> /etc/hosts
			sudo echo "127.0.0.1 www.mlaval.42.fr" >> /etc/hosts
			cd srcs/ && sudo docker compose up -d

build	:
			cd srcs/ && sudo docker compose build

up:
			cd srcs/ && sudo docker compose up -d 

down	:
			cd srcs/ && sudo docker compose down

pause:
			cd srcs/ && sudo docker compose pause

unpause:
			cd srcs/ && sudo docker compose unpause

clean	:
			cd srcs/ && sudo docker compose down -v --rmi all --remove-orphans

fclean	:	clean
			sudo docker system prune --volumes --all --force
			sudo rm -rf /home/mlaval/data
			sudo docker network prune --force
			echo docker volume rm $(docker volume ls -q)
			sudo docker image prune --force

re		:	fclean all