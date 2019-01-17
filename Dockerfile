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
  subversion \
  ant \
  nano \
  iputils-ping \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://packages.chef.io/files/stable/chefdk/3.6.57/ubuntu/18.04/chefdk_3.6.57-1_amd64.deb && \
    dpkg -i chefdk_3.6.57-1_amd64.deb
COPY hosts /etc/hosts
COPY resolv.conf /etc/resolv.conf
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY settings.xml /var/jenkins_home/.m2/settings.xml
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
