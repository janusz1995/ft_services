FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENTRYPOINT ["telegraf"]