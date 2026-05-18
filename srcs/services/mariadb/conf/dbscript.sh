#!/bin/sh

mkdir -p /run/mysqld/

chmod -R 755 /var/lib/mysql/
chown -R mysql:mysql /run/mysqld/

cat << EOF > /tmp/db.sql
CREATE DATABASE IF NOT EXISTS $MYDB;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON '$MYDB'.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

#cat db.sql

exec mysqld  --init-file=/tmp/db.sql
