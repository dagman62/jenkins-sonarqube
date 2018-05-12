FROM dagman62/jenkins-docker
USER root

RUN apt-get update && apt-get install -y \
  maven \
  gradle \
  openjdk-8-jdk \
  && rm -rf /var/lib/apt/lists/*

USER jenkins

RUN mkdir -p /var/jenkins_home/.m2

COPY settings.xml /var/jenkins_home/.m2/settings.xml
