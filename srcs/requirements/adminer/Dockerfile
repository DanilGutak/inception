FROM debian:bullseye


RUN apt update 
RUN apt upgrade
RUN apt install php-fpm -y \
php-mysql  curl  php-curl  \
php-gd  php-intl  php-mbstring  php-soap  \
php-xml  php-xmlrpc  php-zip  php-json  php-imagick  \
php-redis  wget 

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]