node('Slave_Mac') {
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
        
        post {
            always {
              echo 'This will always run'
            }
            success {
              echo 'This will run only if successful'
              junit 'build/test-results/test/*.xml'
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
}
