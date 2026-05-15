#!/bin/sh
mkdir -p /run/php
cd /var/www/html/wordpress
wp core download --allow-root

chmod -R 775 /etc/php/
echo  "\nlisten=0.0.0.0:9000\n" >> /etc/php/8.4/fpm/pool.d/www.conf
echo  "----------\n"
cat /etc/php/8.4/fpm/pool.d/www.conf
echo  "----------\n"
echo "this is the db $MYDB"

wp config create --dbname="$MYDB" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=mariadb:3306 --allow-root
wp core install --url="$domainName" --title="$siteTitle" --admin_user="$adminUser" --admin_password="$adminPass" --admin_email="$emailAdm" --allow-root
#wp user create "$otherUserName" "$otherUserEmail" --role="$othersRole" --user_pass="$othersPass" --allow-root

echo "this is the db $MYDB"
echo "this is dbpass $DB_PASS"

exec php-fpm8.4 -F
