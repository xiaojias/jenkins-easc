#!/bin/sh

# Re-Build image if necessary
cd master
./re-build-jenkins-image.sh

cd ..

# Deploy Jenkins
kubectl create namespace jenkins

mkdir -p /pv
chmod 777 /pv
kubectl apply -f master/pv.yaml
kubectl apply -f master/pvc.yaml

kubectl apply -f master/configmap.yaml
kubectl apply -f master/jenkins-rbac.yaml

kubectl apply -f master/deployment.yaml
kubectl apply -f master/service.yaml

kubectl apply -f ingress/ingress.yaml
kubectl apply -f ingress/apple.yaml

# Optional
kubectl apply -f master/service-nodeport.yaml

