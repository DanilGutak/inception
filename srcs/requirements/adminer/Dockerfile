FROM debian:bullseye


RUN apt update 
RUN apt upgrade
RUN apt install php-fpm -y \
php-mysql -y curl -y php-curl -y \
php-gd -y php-intl -y php-mbstring -y php-soap -y \
php-xml -y php-xmlrpc -y php-zip -y php-json -y php-imagick -y \
php-redis -y wget -y

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]