#!/bin/sh

# Deploy Jenkins
kubectl create namespace jenkins

mkdir -p /pv
chmod 777 /pv
kubectl apply -f master/yaml/pv.yaml
kubectl apply -f master/yaml/pvc.yaml

kubectl apply -f master/yaml/configmap.yaml
kubectl apply -f master/yaml/jenkins-rbac.yaml

kubectl apply -f master/yaml/deployment.yaml
kubectl apply -f master/yaml/service.yaml

kubectl apply -f ingress/ingress.yaml
kubectl apply -f ingress/apple.yaml

# Optional
kubectl apply -f master/yaml/service-nodeport.yaml

