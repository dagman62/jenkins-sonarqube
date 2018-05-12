node {
    def myJenkinsContainer = docker.image('dagman62/jenkins-sonarqube')
    myJenkinsContainer.pull()

    stage('prep') {
        git url: 'https://github.com/dagman62/jenkins-sonarqube.git'
    }

    stage('build') {
      myJenkinsContainer.inside("-v ${env.HOME}/.m2:/var/jenkins_home/.m2") {
        mvn clean package
      }
    }

    stage('sonar-scanner') {
      def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
      withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
        sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=${sonarLogin} -Dsonar.projectName=gs-gradle -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=complete/src/main/ -Dsonar.tests=complete/src/test/ -Dsonar.language=java"
      }
    }
}
