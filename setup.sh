minikube start --vm-driver=virtualbox --cpus=2 --disk-size=5000mb --memory=2000mb
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f srcs/metallb-config.yaml
docker build -t nginx srcs/nginx/
docker build -t php srcs/php/
docker build -t mariadb srcs/mysql/
docker build -t wordpress srcs/wordpress/
docker build -t influxdb srcs/influxdb/
docker build -t telegraf srcs/telegraf/
docker build -t grafana srcs/grafana/
docker build -t ftps srcs/ftps/

kubectl apply -f srcs/mysql/mariadb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/php/php.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml

minikube dashboard

# kubectl delete all --all
# kubectl delete pvc --all
# kubectl delete pv --all
