minikube start --vm-driver=virtualbox --cpus=2 --disk-size=5000mb --memory=2000mb
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f metallb-config.yaml
docker build -t nginx nginx/
docker build -t php php/

kubectl apply -f nginx/nginx.yaml
kubectl apply -f php/php.yaml

minikube dashboard
