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

    stage('Static Code Analysis') {
        steps {
            echo '------------>Análisis de código estático<------------'
            //withSonarQubeEnv('Sonar') {
            //    sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
            //}
        }
    }
    
    stage('Build') {
      steps {
        echo "------------>Build<------------"
        sh 'xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"'
      }
    }
    
    stage('Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        //sh 'xcodebuild -scheme "ADNProject" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=13.3" -enableCodeCoverage YES'
      }
    }
  }
  
  post {
    always {
        echo 'This will always run'
    }
    success {
        echo 'This will run only if successful'
      // junit 'build/test-results/test/*.xml' → RUTA DE TUS ARCHIVOS .XML
    }
    failure {
        echo 'This will run only if failed'
        mail (to: 'santiago.gomez@ceiba.com.co',subject: "Failed Pipeline:${currentBuild.fullDisplayName}",body: "Something is wrong with ${env.BUILD_URL}")
    }
    unstable {
        echo 'This will run only if the run was marked as unstable'
    }
    changed {
        echo 'This will run only if the state of the Pipeline has changed'
        echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}



    
    
    
