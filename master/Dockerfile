FROM jenkins/jenkins:lts

# # Distributed Builds plugins
# RUN /usr/local/bin/install-plugins.sh ssh-slaves

# #Install GIT
# RUN /usr/local/bin/install-plugins.sh git

# # UI
# RUN /usr/local/bin/install-plugins.sh greenballs

# RUN /usr/local/bin/install-plugins.sh simple-theme-plugin
# # Scaling

# # Test to if the dependencies are installed
# RUN /usr/local/bin/install-plugins.sh ant:1.11

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY setup-plugins.sh /usr/share/jenkins/ref/setup-plugins.sh
# RUN chmod +x /usr/share/jenkins/ref/setup-plugins.sh

RUN ["/usr/share/jenkins/ref/setup-plugins.sh", "/usr/share/jenkins/ref/plugins.txt"]

# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Add for Configuration as Code plugin
# configMap of 'jenkins-configuration-as-code' is required to be create
ENV CASC_JENKINS_CONFIG=/var/jenkins_config
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

VOLUME /var/jenkins_home

USER jenkins
