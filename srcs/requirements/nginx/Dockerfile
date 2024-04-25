FROM debian:stable-20240311

RUN apt-get update && apt-get install -y nginx openssl

COPY ./tools/dgutak.42.fr.crt /etc/ssl/certs/dgutak.42.fr.crt 
COPY ./tools/dgutak.42.fr.key /etc/ssl/private/dgutak.42.fr.key

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]   