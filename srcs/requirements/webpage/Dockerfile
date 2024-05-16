FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN echo "server {\
listen 80 ;\
root    /var/www/html;\
index    index.html;\
}" > /etc/nginx/conf.d/nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]  