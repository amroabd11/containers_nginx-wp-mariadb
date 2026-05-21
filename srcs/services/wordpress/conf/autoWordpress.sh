#!/bin/sh
mkdir -p /run/php
mv -f /config.php /var/www/html/wordpress/wp-config.php
cd /var/www/html/wordpress

until mariadb-admin ping -h mariadb -u 4mr0 -p"4mr0_none" --silent ; do
	echo "mariadb still not connected"
	sleep 2
done

if [ -f "wp-load.php" ]; then
	echo "wordpress files already exist"
else 
	wp core download --allow-root
fi

chmod -R 775 /etc/php/
if [ -f "wp-config-sample.php" ] ;then
	mv wp-config-sample.php wp-config.php 
fi
if [ -f "config.php" ]; then
	mv config.php wp-config.php 
fi
echo  "\nlisten=0.0.0.0:9000" >> /etc/php/8.2/fpm/pool.d/www.conf

echo "this is the version *******"
ls /etc/php/

#wp config create --dbname="mariadb" --dbuser="4mr0" --dbpass="4mr0_none" --dbhost="mariadb" --allow-root
wp  core install --url="$domainName" --title="$siteTitle" --admin_user="$adminUser" --admin_password="$adminPass" --admin_email="$emailAdm" --allow-root
#wp user create "$otherUserName" "$otherUserEmail" --role="$othersRole" --user_pass="$othersPass" --allow-root

exec php-fpm8.2 -F
