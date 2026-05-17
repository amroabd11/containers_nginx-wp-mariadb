#!/bin/sh

mkdir -p /run/mysqld/
chown -R mysql:mysql /var/lib/mysql/
chmod -R 700 /var/lib/mysql/

cat << EOF > /tmp/db.sql
CREATE DATABASE IF NOT EXISTS '$MYDB';
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON '$MYDB'.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

#cat db.sql

exec mysqld --user=root --bind-address=127.0.0.1 --port=3306 --init-file=/tmp/db.sql
