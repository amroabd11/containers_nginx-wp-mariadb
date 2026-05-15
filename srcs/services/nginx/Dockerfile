FROM debian

RUN apt update -y&&apt upgrade -y && apt install nginx openssl -y
COPY ./conf/default.conf /etc/nginx/nginx.conf 
RUN mkdir /etc/nginx/ssl
RUN mkdir /var/www/html/wordpress
RUN chown -R  www-data:www-data /var/www/html/wordpress
RUN openssl req -x509 -nodes -days 1 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.cert -subj "/CN=localhost"


CMD ["nginx","-g","daemon off;"]
