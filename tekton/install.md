With Tekton, build Jenkins master docker image, setup Jenkins master instance and load configuration from git source.

## Create Jenkins-master Docker image from GitHub source code

**Steps (Success on Feb 16, 2019)**

- Create yaml files
- - Create roles (serviceaccount, secret, clusterrole, rulebinding);
- - Create resources;
- - Create tasks;
- - Create pipeline;
- - Create pipelinerun

- Deploy yaml files

```bash
# kubectl apply -f role/.
clusterrole.rbac.authorization.k8s.io/jenkins-master-tekton created
clusterrolebinding.rbac.authorization.k8s.io/jenkins-master-binding created
secret/jenkins-master-docker created
secret/jenkins-master-github created
serviceaccount/jenkins-master-tekton created

# kubectl apply -f resource/.
pipelineresource.tekton.dev/docker-image-jenkins-master created
pipelineresource.tekton.dev/jenkins-git created

# kubectl apply -f task/.
task.tekton.dev/build-docker-image-from-git-source created

# kubectl apply -f pipeline/.
pipeline.tekton.dev/build-docker-image created

# kubectl apply -f pipelinerun/.
pipelinerun.tekton.dev/build-docker-image-jenkins-master created

```

Or

- Run in batch with commands:
  Create tekton components:

```bash
# kubectl apply -f jenkins-master/
```

Run Pipeline to rebuild Jenkins master image:

```bash
# kubectl apply -f jenkins-master/runs/build-docker-image-for-jenkins-master.yaml
```

Open Tekton dashboard can see the pipelinerun is running well.

## Deploy Jenkins instance into Kubernetes Cluster

### Deploy via YAMLs

Notes:

- Default to 'jenkins' namespace

Steps:

- Create Tekton resources

  ```bash
  # kubectl apply -f jenkins-master/
  ```

- (Optional) Run pipelinerun to rebuild Jenkins-master docker image

  ```bash
  # kubectl apply -f jenkins-master/run
  ```

### Deploy via Tekton

- Set environment properties
  Change namespace in following file:

  ```bash
  # cat ./tekton/jenkins-master/runs/env.yaml
    metadata:
        namespace: test
  ```

- Create the namespace if missing

  ```bash
  # kubectl create ns test
  namespace/test-new created
  ```

- Deploy Jenkins instance
- - Preactions
    Create PV and Cluster roles.

```bash
# kubectl apply -f pre-yaml/

```

- - Setup Jenkins master instance in 'test' namespace via Tekton

```bash
# kubectl apply -f tekton/jenkins-master/

# kubectl apply -f tekton/jenkins-master/runs/pipelinerun-deploy-jenkins-master-from-templates.yaml

```

## Apply configuration into Jenkins instance via JCasC

- Reload to apply JCasC configuration
  Login Jenkins UI https://ecs-00:31090/configuration-as-code/, click 'Apply new configuration' button.

Switch to Jenkins dashboard, there will be some jobs created there.
