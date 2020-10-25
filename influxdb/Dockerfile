FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add influxdb

EXPOSE 8086
ENTRYPOINT ["influxd"]