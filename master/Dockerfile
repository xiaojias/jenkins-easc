FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY setup-plugins.sh /usr/share/jenkins/ref/setup-plugins.sh

RUN /usr/share/jenkins/ref/setup-plugins.sh /usr/share/jenkins/ref/plugins.txt

# Add for Configuration as Code plugin
# configMap of 'jenkins-configuration-as-code' is required to be create
ENV CASC_JENKINS_CONFIG=/var/jenkins_config
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

VOLUME /var/jenkins_home

USER jenkins
