FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add wget php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN mv wordpress /www/
RUN rm latest.zip

COPY wp-config.php /www/
COPY start_wp.sh .

EXPOSE 5050

ENTRYPOINT ["sh", "start_wp.sh"]