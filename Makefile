
wp_dir=/home/aamraouy/data/wp
db_dir=/home/aamraouy/data/db
compose=docker-compose --file srcs/docker-compose.yml

all:build
	@mkdir -p $(wp_dir)
	@mkdir -p $(db_dir)

build:
	$(compose) build
	$(compose) up

