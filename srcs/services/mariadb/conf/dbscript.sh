#!/bin/sh

mkdir -p /run/mysqld/

#chmod -R 755 /var/lib/mysql/
chown -R mysql:mysql /run/mysqld/
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

cat << EOF > /tmp/db.sql
CREATE DATABASE IF NOT EXISTS $MYDB;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $MYDB.* TO '$DB_USER'@'%';
ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
EOF

#cat db.sql

exec mysqld  --init-file=/tmp/db.sql
