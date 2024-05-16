FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install borgbackup -y cron -y mariadb-client -y

ARG BORG_REPO="/home/borguser/backup"
ARG DB_USER DB_USER_PW DB_NAME 


RUN adduser --disabled-password -u 1000 borguser

COPY /requirements/borgbackup/backup_db.sh /home/borguser/backup_db.sh
RUN chmod +x /home/borguser/backup_db.sh


WORKDIR /home/borguser



RUN sed -e "s~\$DB_USER_PW~$DB_USER_PW~g" \
    -e "s~\$DB_USER~$DB_USER~g" \
    -e "s~\$DB_NAME~$DB_NAME~g" \
    -e "s~\$BORG_REPO~$BORG_REPO~g" \
backup_db.sh > backup_db2.sh
RUN chmod +x backup_db2.sh
RUN echo "0 0 * * * /home/borguser/backup_db2.sh" > /home/borguser/crontab.txt && \
    crontab -u root /home/borguser/crontab.txt && rm /home/borguser/crontab.txt

# Set the entry point to BorgBackup
ENTRYPOINT ["cron", "-f"]