FROM debian

RUN apt update -y&&apt upgrade -y && apt install nginx openssl -y
COPY ./conf/default.conf /etc/nginx/sites-available/default 
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 1 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.cert -subj "/CN=localhost"

EXPOSE 8080

CMD ["nginx","-g","daemon off;"]
