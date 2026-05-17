FROM debian:bookworm

RUN apt update && apt install mariadb-server -y
COPY ./conf/dbscript.sh /dbscript.sh
RUN chmod +x /dbscript.sh
ENTRYPOINT ["./dbscript.sh"]
