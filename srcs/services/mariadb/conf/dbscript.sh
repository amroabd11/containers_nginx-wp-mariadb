#!/bin/sh
mkdir -p /run/mysqld/
touch db.sql
chmod 1777 db.sql
cat << EOF > db.sql
CREATE DATABASE $MYDB;
CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $MYDB.* TO '$DB_USER'@'$DB_HOST';
FLUSH PRIVILEGES;
EOF

exec mysqld --user=root --bind-address=0.0.0.0 --init-file=/db.sql
