#!/bin/sh

### Clean the installation

kubectl delete -f master/yaml/deployment.yaml
kubectl delete -f master/yaml/service.yaml
kubectl delete -f master/yaml/configmap.yaml
kubectl delete -f master/yaml/jenkins-rbac.yaml

kubectl delete -f ingress/ingress.yaml
kubectl delete -f ingress/apple.yaml

kubectl delete -f master/yaml/pvc.yaml

kubectl delete -f master/yaml/pv.yaml

# Optional
kubectl delete -f master/yaml/service-nodeport.yaml
kubectl delete namespace jenkins

rm -rf /pv
