FROM dagman62/jenkins
USER root
RUN apt-get update && apt-get install -y \
  groovy maven gradle nodejs unzip curl \
  && rm -rf /var/lib/apt/lists/*
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
ADD settings.xml /var/jenkins_home/.m2/settings.xml
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
