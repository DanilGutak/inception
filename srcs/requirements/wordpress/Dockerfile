FROM debian:bullseye


RUN apt update 
RUN apt upgrade
RUN apt install php-fpm -y php-mysql -y curl -y


RUN mkdir -p /run/php

COPY requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY requirements/wordpress/wp-init.sh .

RUN chmod +x wp-init.sh

ENTRYPOINT [ "./wp-init.sh" ]