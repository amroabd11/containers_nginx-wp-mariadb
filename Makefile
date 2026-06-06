
wp_dir=/home/aamraouy/data/wp
db_dir=/home/aamraouy/data/db
compose=docker-compose -f srcs/docker-compose.yml
up=docker-compose -f srcs/docker-compose.yml up
down=docker-compose -f srcs/docker-compose.yml down

all:build

build:
	mkdir -p $(wp_dir)
	mkdir -p $(db_dir)
	$(compose) build
	$(compose) up
up:
	$(up)
down:
	$(down)
clean:
	docker system prune -f
fclean:clean
<<<<<<< HEAD
	rm -rf $(wp_dir)
	rm -rf $(db_dir)
=======
>>>>>>> refs/remotes/origin/main
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q)	
re:fclean all
