FROM dagman62/jenkins
USER root
RUN apt-get update && apt-get install -y unzip curl
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER root
RUN apt-get purge -y --auto-remove curl unzip && rm -rf /var/lib/apt/lists/*
USER jenkins
