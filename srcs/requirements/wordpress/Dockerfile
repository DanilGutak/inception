FROM debian:stable-20240311

# Install PHP and PHP-FPM
RUN apt-get update && apt-get install -y php php-fpm

#Install Wordpress
RUN apt-get install -y wget && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    rm -rf latest.tar.gz

EXPOSE 9000

ENTRYPOINT ["php-fpm7.3", "-F"] 