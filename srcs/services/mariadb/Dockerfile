FROM debian:bookworm

RUN apt update && apt install mariadb-server -y
COPY ./conf/dbscript.sh /dbscript.sh
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /dbscript.sh
ENTRYPOINT ["./dbscript.sh"]
