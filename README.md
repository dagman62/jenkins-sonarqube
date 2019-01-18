# jenkins-sonarqube
Jenkins running sonarqube, maven, gradle, jdk8, and docker
---
http://localhost:9000
login admin:admin
---

Put the Jenkinsfile in the repository where the resources are for the maven build

# Jenkins

Download and install the sonarqube scanner plugin, and create global secret-file credentials with using sonar as the id and description
and use the token generated from sonaqube as the password
---
http://localhost:8080
To get temp password run docker logs -f jenkins
---
