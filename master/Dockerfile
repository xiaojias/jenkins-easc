FROM jenkins/jenkins:2.176.1

# Add for Configuration as Code plugin
# configMap of 'jenkins-configuration-as-code' is required to be create
ENV CASC_JENKINS_CONFIG=/var/jenkins_config

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

#Install GIT
RUN /usr/local/bin/install-plugins.sh git

# UI
RUN /usr/local/bin/install-plugins.sh greenballs

RUN /usr/local/bin/install-plugins.sh simple-theme-plugin
# Scaling
RUN /usr/local/bin/install-plugins.sh \
  kubernetes \
  blueocean \
  job-dsl \
  cloudbees-folder \
  workflow-aggregator \
  pipeline-utility-steps \
  generic-webhook-trigger \
  git-changelog \
  configuration-as-code \
  configuration-as-code-support \
  violation-comments-to-gitlab \
  next-build-number

VOLUME /var/jenkins_home

USER jenkins
