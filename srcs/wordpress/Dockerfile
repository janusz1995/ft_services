FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add wget
RUN apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx openrc supervisor

RUN adduser -D -g 'www' www
RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN mv wordpress /www/
RUN rm latest.zip

COPY supervisor.conf /etc/supervisord.conf
COPY wp-config.php /www/wordpress/
COPY start_wp.sh .

EXPOSE 5050

ENTRYPOINT ["sh", "start_wp.sh"]