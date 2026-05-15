#!/bin/sh
mkdir -p /run/mysqld/
#touch db.sql
chmod -R 775 /var/lib/mysql/
cat << EOF > /var/lib/mysql/db.sql
CREATE DATABASE '$MYDB';
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON '$MYDB'.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

#cat db.sql

exec mysqld --user=root --bind-address=0.0.0.0 --port=3306 --init-file=/var/lib/mysql/db.sql
