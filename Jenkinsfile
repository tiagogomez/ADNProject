pipeline {

  agent {
    label 'Slave_Mac'
  }
  
  options {
    buildDiscarder(logRotator(numToKeepStr: '3'))
    disableConcurrentBuilds()
  }
  
  tools {
    jdk 'JDK8_Centos' //Preinstalada en la Configuración del Master
  }
  
  stages {
    stage('Checkout') {
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                credentialsId: 'GitHub_tiagogomez',
                url: 'https://github.com/tiagogomez/ADNProject'
            ]]
        ])
    }
    
    stage('Static Code Analysis') {
        steps {
            echo '------------>Análisis de código estático<------------'
            withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"}
        }
    }
  }
}



    
    
    
