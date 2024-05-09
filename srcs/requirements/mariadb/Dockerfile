FROM alpine:3.18

ARG DB_NAME DB_USER DB_USER_PW DB_ROOT_PW

RUN apk update && apk add mariadb mariadb-client

RUN mkdir /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY  requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod 644 /etc/my.cnf.d/mariadb-server.cnf
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql


COPY requirements/mariadb/conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql
ENTRYPOINT ["/usr/bin/mysqld", "--skip-log-error", "--init-file=/db.sql"]
