FROM alpine:latest

RUN apk update && apk upgrade && apk add mariadb mariadb-client && apk add openrc
COPY my.cnf /etc/
COPY start_mariadb.sh .
COPY create_db .
COPY my_db.sql .
VOLUME ["/var/lib/mariadb"]

EXPOSE 3306

ENTRYPOINT ["sh", "start_mariadb.sh"]