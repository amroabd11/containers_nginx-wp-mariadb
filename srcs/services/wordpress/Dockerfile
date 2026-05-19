FROM debian:bookworm
RUN apt-get update -y && apt-get install -y php wget unzip php-fpm php-mysqli mariadb-client
RUN mkdir -p /var/www/html/wordpress 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 775 /var/www/html/wordpress

COPY ./conf/autoWordpress.sh / 
COPY ./conf/config.php /
RUN chmod +x ./autoWordpress.sh
ENTRYPOINT ["./autoWordpress.sh"]
