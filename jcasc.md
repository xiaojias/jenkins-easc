## Introduce
The Configuration as Code plugin has been designed to as an opinionated way to config Jenkins based on human-readable declarative configuration files. Writing such a file should be feasible without being a jenkins expert, just translating into code a configuration process one is used to excuting in Jenkins UI.

## Enable steps
Create Jenkins instance in Kubernetes, and install Configuration as Code plugin and apply basic configuration and enhancement.
### Getting Started
The following steps are already included in updated ![Jenkins installation](./install.md)
- Start a Jenkins instance with the Configuration as Code plugin installed;
- Set CASC_JENKINS_CONFIG environment variable, points to the path and/or files;
- Create an initial ![Jenkins file](./master/yaml/jenkins.yaml);

E.g config this in ![Dockerfile](./master/Dockerfile)

- If everything is correct, you would be able to 'view Configuration' from Jenkins UI (Jenkins --> Manage Jenkins --> Configuration as Code)

**Known issue**
In case of "/var/jenkins_home/casc_configs directory is invalid while opening Jenkins UI", you can create it and copy jenkins.yaml file into mounted pv to bypassing the issue.

### Initial Configuration
- Create more configuration files for Jenkins instance and/or jobs;

- Copy files into pod on CASC_JENKINS_CONFIG variable (e.g /var/jenkins_home/casc_configs in ![Dockerfile](./master/Dockerfile) directory; 
For example:
```bash
# kubectl cp ./casc_configs/init/jenkins.yaml jenkins/<pod name>:/var/jenkins_home/casc_configs

```

- Import it in Jenkins UI
Click "Apply New Configuration" from Jenkins --> Manage Jenkins --> Configuration as Code.

### Advanced configuration
- Create more Configuration files for Jobs, e.g:
![declarative pipeline](./casc_configs/jobs/pipeline.yaml)
![multiple branches](./casc_configs/jobs/multiplebranches.yaml)

- Copy the files into Jenkins-master pod as above step;

- For example, to copy all the ![files and subdirectories](./casc_configs) into pod as JCasC configuratio with command:
```bash
# kubectl cp -R ./casc_configs/* jenkins/<pod name>:/var/jenkins_home/casc_configs

```
**Known issue**
To be sure the contents in all the files are not duplicated. So we can generate ONLY one yaml file based on all the files, in this yaml file, all the redudant properties should be removed out.

- Apply the files in Jenkins UI through 'Jenkins' --> 'Manage Jenkins' --> 'Configuration as Code'

**The process needs to be refined/automated**

**TBD:**
Setup Kubernetes configuration and automated it;
Setup various of agents;

