FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client && apk add openrc
COPY start_mariadb.sh .
COPY create_db .
#CMD sh start_mariadb.sh


#mysql daemon /etc/init.d/mariadb setup rc-service mariadb start

EXPOSE 3306