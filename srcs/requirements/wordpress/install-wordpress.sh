#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sleep 5
if [ ! -f wp-login.php ]; then
    ./wp-cli.phar core download --allow-root
else
    echo "INFO: WordPress core files already exist, skipping download."
fi

if [ ! -f wp-config.php ]; then
    ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PW --dbhost=mariadb --allow-root
    echo loh
else
    echo "INFO: wp-config.php already exists, skipping configuration creation."
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
    ./wp-cli.phar core install --url=localhost --title=inception --admin_user=$DB_USER --admin_password=$DB_USER_PW --admin_email=admin@admin.com --allow-root
else
    echo "INFO: WordPress is already installed, skipping installation."
fi

cat << EOF


----https://localhost:443----
--------abied-ch.42.fr-------
EOF

php-fpm7.4 -F