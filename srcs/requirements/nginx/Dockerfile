FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN  openssl req -x509 -nodes -days 365 -newkey rsa:2048\
 -keyout /etc/ssl/private/dgutak.42.fr.key -out /etc/ssl/certs/dgutak.42.fr.crt -subj "/C=RU/ST=Karelia/L=Petrozavodsk/O=42/OU=42School/CN=dgutak.42.fr"
COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]  