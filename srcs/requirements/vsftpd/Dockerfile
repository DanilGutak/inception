FROM alpine:3.18

ARG FTP_USER FTP_PW

RUN apk update && apk upgrade && \
    apk add  vsftpd

RUN adduser -h /var/www -s /bin/false -D ${FTP_USER} && \
    echo "${FTP_USER}:${FTP_PW}" | /usr/sbin/chpasswd && \
    adduser ${FTP_USER} root

RUN echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_enable=YES" >>   /etc/vsftpd/vsftpd.conf && \
    echo "write_enable=YES" >>  /etc/vsftpd/vsftpd.conf && \
    echo "local_umask=007" >>  /etc/vsftpd/vsftpd.conf&& \
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
    echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

WORKDIR /var/www

EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]