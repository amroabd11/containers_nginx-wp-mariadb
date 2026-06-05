
wp_dir=/home/aamraouy/data/wp
db_dir=/home/aamraouy/data/db
compose=docker-compose -f srcs/docker-compose.yml
up=docker-compose -f srcs/docker-compose.yml up
down=docker-compose -f srcs/docker-compose.yml down

all:build
	@mkdir -p $(wp_dir)
	@mkdir -p $(db_dir)

build:
	$(compose) build
	$(compose) up
up:#TODO STILL didn't check this two rules if are ok
	$(up)
down:
	$(down)
clean:
	docker system prune -f
fclean:clean
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)	
