#!/bin/sh
### Load all the files from a directory  as 'Configuration as Code'

kubectl -n jenkins delete configmap jenkins-configuration-as-code
kubectl -n jenkins create configmap jenkins-configuration-as-code --from-file=$1

## then go to Jenkins UI --> Manage Jenkins --> Configuration as Code -->  'Apply new configruation'
## to take effect by adding above configurations
