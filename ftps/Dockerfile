FROM alpine:latest

RUN	apk update upgrade
RUN	apk add openrc openssl vsftpd
RUN adduser drina -s /bin/false -h /drina
RUN	chown drina:drina /drina

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req \
		-newkey rsa:2048 -nodes -keyout /etc/vsftpd.key \
		-x509 -days 365 -out /etc/vsftpd.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=21school Moscow Company/CN=a@gmail.com"

EXPOSE 21 20 21000-22000

ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]