#!bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then


        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root
fi
#if database is not created yet
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
        echo  > db.sql
        echo "USE mysql;" >> db.sql
        echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PW}';" >> db.sql
        echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> db.sql
        echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED by '${DB_USER_PW}';" >> db.sql
        echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> db.sql
        echo "FLUSH PRIVILEGES;" >> db.sql
        chmod 777 db.sql
        chown -R mysql:mysql db.sql
fi