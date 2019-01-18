FROM dagman62/jenkins
USER root
RUN apt-get update && apt-get install -y \
  groovy \
  maven \
  gradle \
  nodejs \
  unzip \
  curl \
  wget \
  ant \
  && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://updates.jenkins-ci.org/latest/jenkins.war -o /usr/share/jenkins/jenkins.war
RUN wget https://packages.chef.io/files/stable/chefdk/3.6.57/ubuntu/18.04/chefdk_3.6.57-1_amd64.deb && \
    dpkg -i chefdk_3.6.57-1_amd64.deb
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY settings.xml /var/jenkins_home/.m2/settings.xml
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
