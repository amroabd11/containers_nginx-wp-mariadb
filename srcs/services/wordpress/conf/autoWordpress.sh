#!/bin/sh
wp config create --dbname=mariadb --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
wp core install --url=$domainName --title=$siteTitle --admin_user=$adminUser --admin_password=$adminPass --admin_email=$emailAdm --allow-root
wp user create $otherUserName $otherUserEmail --role=$othersRole --user_pass=$othersPass --allow-root


echo $'\nlisten = 9000\n' >> /etc/php/8.4/fpm/pool.d/www.conf
exec php-fpm8.4 -F
