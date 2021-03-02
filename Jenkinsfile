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
        steps {
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
    }
    /*
    stage('Static Code Analysis') {
        steps {
            echo '------------>Análisis de código estático<------------'
            withSonarQubeEnv('Sonar') {
            sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"}
        }
    }
    */
    
    stage('Build') {
      steps {
        echo "------------>Build<------------"
        sh 'xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"'
        //sh 'xcodebuild -scheme "ADNProject" -configuration "Debug" clean build test -destination "platform=iOS Simulator,name=iPhone 11,OS=13.2" -enableCodeCoverage YES'
      }
    }
  }
}



    
    
    
