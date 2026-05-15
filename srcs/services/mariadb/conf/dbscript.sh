#!/bin/sh
mkdir -p /run/mysqld/
touch db.sql
chmod 1777 db.sql
cat << EOF > db.sql
CREATE DATABASE "$MYDB";
CREATE USER "$DB_USER"@'%' IDENTIFIED BY "$DB_PASS";
GRANT ALL PRIVILEGES ON "$MYDB".* TO "$DB_USER"@'%';
FLUSH PRIVILEGES;
EOF

cat db.sql

exec mysqld --user=root --bind-address=0.0.0.0 --port=3306 --init-file=/db.sql
