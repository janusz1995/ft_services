minikube start --vm-driver=virtualbox --cpus=2 --disk-size=5000mb --memory=2000mb
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f metallb-config.yaml
docker build -t nginx nginx/
docker build -t php php/
docker build -t mariadb mysql/
docker build -t wordpress wordpress/
docker build -t influxdb influxdb/
docker build -t telegraf telegraf/
docker build -t grafana grafana/

kubectl apply -f mysql/mariadb.yaml
kubectl apply -f nginx/nginx.yaml
kubectl apply -f php/php.yaml
kubectl apply -f wordpress/wordpress.yaml
kubectl apply -f influxdb/influxdb.yaml
kubectl apply -f telegraf/telegraf.yaml
kubectl apply -f grafana/grafana.yaml

minikube dashboard

# kubectl delete all --all
# kubectl delete pvc --all
# kubectl delete pv --all
