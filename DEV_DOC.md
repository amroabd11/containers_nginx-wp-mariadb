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
as did in my project under conf/autoWordpress
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
