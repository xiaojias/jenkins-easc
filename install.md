Include to install Jenkins on Kubernetes cluster and all the manifests.
# Install Jenkins
1. Create Namespace;
2. Create deployment yaml and deploy it;
3. Create a service yaml and deploy it;
4. Access the Jenkins application on a NodePort;
5. (Optional) Create ingress resource to enable Jenkins portal;
## Build Jenkins Master image and deploy it

1. Build image;
```bash
# VERSION='2.176.1'
# DOCKER_IMAGE="richardx/jenkins-master:${VERSION}"
# docker build -t ${DOCKER_IMAGE} -f master/Dockerfile .
#docker push ${DOCKER_IMAGE}
```
**Note**:
The latest ![Dockerfile](./master/Dockerfile) already includes basic initial CasC configuration for Jenkins instance.

2. Be sure a Persistent Volume is ready;
```bash
# kubectl get pv
```
If missing, create it refering to: ![pv.yaml](master/yaml/pv.yaml) (chown 777 /pv)
3. Create pvc;
```bash
# kubectl create -f master/yaml/pvc.yaml
# kubectl get pvc -n jenkins
<it should be in Pending status>
```
If 'jenkins' namespace missing, create it.
4. Create deployment, service, and ingress resource;
```bash
# kubectl apply -f master/yaml/deployment.yaml
# kubectl apply -f master/yaml/service.yaml
# kubectl apply -f config/ingress.yaml
```
5. Additionally, enable jenkins master as NodePort;
```bash
# kubectl apply -f master/yaml/service-nodeport.yaml
```

## Build Jenkins Slave image and deploy it (TBD)


**Reference**
![Scaling Jenkins on Kubernetes](https://medium.com/faun/how-to-setup-scalable-jenkins-on-kubernetes-f5c1b7d439cd)
