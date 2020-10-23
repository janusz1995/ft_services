docker build -t service_nginx .
docker run -p 80:80 -p 443:443 -it service_nginx
