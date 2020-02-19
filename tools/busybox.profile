# Profile for busybox Pod
# Can create a busybox Pod yaml file based on pod-template.yaml

metadata:
  name: busybox-sample
  namespace: jenkins
spec:
  hostname: busybox
  subdomain: xiaojias.com
  containers:
  - name: busybox
    image: busybox:1.28
    command:
      - sleep
      - "3600"
