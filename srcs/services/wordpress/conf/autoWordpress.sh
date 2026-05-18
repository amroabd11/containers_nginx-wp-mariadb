#!/bin/sh
mkdir -p /run/php
cd /var/www/html/wordpress

until mariadb-admin ping -h"mariadb" -u"4mr0" -p"4mr0none" --silent ; do
	echo "mariadb still not connected"
	sleep 2
done

if [ -f "wp-load.php" ]; then
	echo "wordpress files already exist"
else 
	wp core download --allow-root
fi

chmod -R 775 /etc/php/
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php 
mv ./config.php /var/www/html/wordpress/wp-config.php 
sed -i  's/listen=0.0.0.0:9000' /etc/php/8.4/fpm/pool.d/www.conf


#wp config create --dbname="mariadb" --dbuser="4mr0" --dbpass="4mr0none" --dbhost="mariadb:3306" --allow-root
wp core install --url="$domainName" --title="$siteTitle" --admin_user="$adminUser" --admin_password="$adminPass" --admin_email="$emailAdm" --allow-root
#wp user create "$otherUserName" "$otherUserEmail" --role="$othersRole" --user_pass="$othersPass" --allow-root


exec php-fpm8.4 -F
