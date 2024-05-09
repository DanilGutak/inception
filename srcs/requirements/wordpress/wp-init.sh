#!/bin/sh

sleep 1
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PW --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title="incpetion by dgutak" --admin_user=$DB_USER \
 --admin_password=$DB_USER_PW --admin_email=$WP_MAIL --allow-root


echo "WORDPRESS IS RUNNING...\nGo to https://localhost or https://dgutak.42.fr to see it"
php-fpm7.4 -F