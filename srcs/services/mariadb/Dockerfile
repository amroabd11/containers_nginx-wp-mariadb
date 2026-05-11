
FROM debian

RUN apt update && apt upgrade && apt install -y mariadb-server
COPY ./conf/configs.sh dbscript.sh
RUN chmod +x dbscript.sh

CMD ["./dbscript"]
