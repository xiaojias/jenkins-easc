## Introduce
The Configuration is configured as ConfigMap during Jenkins instance installation. This section describes the steps for installation and further configuration.

## Steps
### Installation
Includes:
- Create '/pv' directory for PV storage;
- Create kubernetes resources, e.g configmap, deploymet, service, ingress resource, pv and pvc;
- Create Jenkins instance with initial Jenkins configuration;

The command is:
```bash
# ./deploy-without-build.sh

```
If Dockerfile is updated, and it is required to take effect, can perform the command:
```bash
# ./deploy.sh

```

### Apply further Jenkins configuration via JCasC
Update configmap and then reload it by:
- Update cofigmap with command:
```bash
# load-file-as-code.sh ./casc_configs
```
- Apply new configuration for JCasC plugin (or restart Jenkins instance - not suggested)
perform the action in Jenkins UI --> Manage Jenkins --> Configuration as Code --> click 'Apply new configuration'




