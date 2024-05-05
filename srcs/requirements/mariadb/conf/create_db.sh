#!bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then


        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root
fi
# if database is not created yet
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
        echo  > db.sql
        echo "USE mysql;" >> db.sql
        echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PW}';" >> db.sql
        echo "CREATE DATABASE ${DB_NAME};" >> db.sql
        echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_USER_PW}';" >> db.sql
        echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> db.sql
        echo "FLUSH PRIVILEGES;" >> db.sql
        /usr/bin/mysqld --user=mysql --bootstrap < db.sql
        rm -f db.sql
fi