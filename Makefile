
wp_dir=/home/aamraouy/data/wp
db_dir=/home/aamraouy/data/db
compose=docker-compose -f srcs/docker-compose.yml

all:build
	@mkdir -p $(wp_dir)
	@mkdir -p $(db_dir)

build:
	$(compose) build
	$(compose) up
clean:
	docker system prune -y
fclean:clean
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls)	
