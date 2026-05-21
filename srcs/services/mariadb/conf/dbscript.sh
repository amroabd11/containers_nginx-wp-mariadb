#!/bin/sh

mkdir -p /run/mysqld/

#chmod -R 755 /var/lib/mysql/
chown -R mysql:mysql /run/mysqld/
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

echo "CREATE DATABASE IF NOT EXISTS $MYDB;" > /tmp/db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" >> /tmp/db.sql;
echo "GRANT ALL PRIVILEGES ON $MYDB.* TO '$DB_USER'@'%'" >> /tmp/db.sql;
echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" >> /tmp/db.sql;
echo "FLUSH PRIVILEGES" >> /tmp/db.sql;

#cat db.sql

exec mysqld  --init-file=/tmp/db.sql
