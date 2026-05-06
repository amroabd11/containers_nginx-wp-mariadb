FROM debian
RUN apt update -y && apt upgrade -y && apt install -y php curl unzip
RUN mkdir /var/www/html/wordpress 
COPY ./conf/autoWordpress.sh .
RUN chmod +x autoWordpress.sh
ENTRYPOINT ["./autoWordpress.sh"]
