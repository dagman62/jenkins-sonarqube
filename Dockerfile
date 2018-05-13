FROM dagman62/jenkins
USER root

RUN apt-get update && apt-get install -y \
  maven && \
  rm -rf /var/lib/apt/lists/*

USER jenkins

RUN mkdir -p /var/jenkins_home/.m2

COPY settings.xml /var/jenkins_home/.m2/settings.xml
