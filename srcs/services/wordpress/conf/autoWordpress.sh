#!/bin/sh
mkdir -p /run/php
cd /var/www/html/wordpress

until mariadb-admin ping -h $DB_HOST -u $DB_USER -p"$DB_PASS" --silent ; do
	echo "mariadb still not connected"
	sleep 2
done

if [ -f "wp-load.php" ]; then
	echo "wordpress files already exist"
else 
	wp core download --allow-root
fi

chmod -R 775 /etc/php/

echo  "\nlisten=0.0.0.0:9000" >> /etc/php/8.2/fpm/pool.d/www.conf


if [ ! -f "wp-config.php" ]; then
	wp config create --dbname="$MYDB" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --allow-root
	wp  core install --url="$domain" --title="$siteTitle" --admin_user="$adminUser" --admin_password="$adminPass" --admin_email="$emailAdm" --allow-root
	#mv /config.php /var/www/html/wordpress/wp-config.php
	wp user create "$otherUserName" "$otherUserEmail" --role="$othersRole" --user_pass="$othersPass" --allow-root
else
	echo "wordpress already installed and configured"
fi

exec php-fpm8.2 -F
