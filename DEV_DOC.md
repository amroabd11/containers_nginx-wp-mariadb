a DEV guide through inception infra.
## how to set up the infra from scratch:
this step requires from u to create custom images in order docker uses them to create containers , the nginx custom image
provided by the Dockerfile within srcs/services/nginx/Dockerfile and each service by its own dockerfile , all of them 
are orchestrated by docker-compose.yml file where each service section mentions the path to the image in use

## nginx setup :
creating a config file named nginx.conf to replace in the default one of the container under the path /etc/nginx/default.conf.
```
http {
	include mime.types;
	server {
		listen 443 ssl;
		server_name aamraouy.42.fr;
		root /var/www/html/wordpress;
		index index.php index.html;
		ssl_certificate /etc/nginx/ssl/public.cert;
		ssl_certificate_key /etc/nginx/ssl/private.key;
		ssl_protocols TLSv1.2 TLSv1.3;

		location / {
			try_files $uri $uri/ /index.php?$args;
		}

		location ~ \.php$ {
			fastcgi_index index.php;
			include fastcgi_params;
			fastcgi_pass wordpress:9000;
			fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
			fastcgi_param HTTP_HOST $http_host;
		}
	}
}
```
## wordpress setup :
creating a config file or just by using wp-cli which is future that provides a comand line interface to interact with the running daemon
as did in my project under conf/autoWordpress.sh
```
if [ ! -f "wp-config.php" ]; then
	wp config create --dbname="$MYDB" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --allow-root
	wp  core install --url="$domain" --title="$siteTitle" --admin_user="$adminUser" --admin_password="$adminPass" --admin_email="$emailAdm" --allow-root
	#mv /config.php /var/www/html/wordpress/wp-config.php
	wp user create "$otherUserName" "$otherUserEmail" --role="$othersRole" --user_pass="$othersPass" --allow-root
else
	echo "wordpress already installed and configured"
fi
```
this will set up the configs for wordpress to connect to the db.

## mariadb setup :
under the mariadb container i had to use the server.cnf file in which is the one responsible for configuring the mysqld since is the one
i'm using to run the db.sql file , like shown in here:
```
[mysqld]

user = mysql
datadir = /var/lib/mysql
pid-file = /run/mysqld/mysqld.pid
socket = /run/mysqld/mysqld.sock
port = 3306
basedir = /usr
datadir = /var/lib/mysql
tmpdir = /tmp
lc-messages-dir = /usr/share/mysql
log-error = /var/log/mysql/error.log

bind-address = 0.0.0.0
```
and the script i'm running when container is up -in its entrypoint- is:
```
#!/bin/sh

mkdir -p /run/mysqld/

#chmod -R 755 /var/lib/mysql/
chown -R mysql:mysql /run/mysqld/
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

echo "CREATE DATABASE IF NOT EXISTS $MYDB;" > /tmp/db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/db.sql
echo "GRANT ALL PRIVILEGES ON $MYDB.* TO '$DB_USER'@'%';" >> /tmp/db.sql
echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/db.sql
echo "FLUSH PRIVILEGES;" >> /tmp/db.sql

#cat db.sql

exec mysqld  --init-file=/tmp/db.sql
```
## building the project
- to create a container we build an image:
> docker build -t wordpress . 
but first thing you need to be in the working directory of that dockerfile you are building
Now we have wordpress built
we deal with it by starting or running it directly:
> docker run -it wordpress cmd
when do we start it is when it had been already run and stoped that makes it appear within the docker ps -a -stoped processes-
> docker start wordpress

but one thing in my infra is you don't need all this you can just by using make build the entire images and link them to the network and run them
> make all

or by using ``make down `` you set down the running containers meaning the entire infra
also to not that inside the makefile we are just using the docker-compose utility nothing else
like this :
> docker compose build
- this deals with the docker-compose.yml it parses it and look for the dockerfiles to build the images and set volumes ,networks and exposes ports if any
and up commes in to play
> docker compose up
runs the entire infra.
## inspecting the infra containers
just by using ``docker inspect container_id`` 
## listing volumes and networks
> docker volumes ls
> docker network ls

## where data is stored 
to note that docker containers are stored within the **/var/lib/docker/** path, this unlocks the oportunity to perform an analyzis of each container to see
the logs if any miss happens.
or by using ``docker logs container_id``

