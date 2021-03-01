node('Slave_Mac') {

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
            withSonarQubeEnv('Sonar') {
                sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
            }
        }
    }
    
    stage('/Build/Test') {
        // Build and Test
        sh 'xcodebuild clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"'
        //sh 'xcodebuild -scheme "ADNProject" -configuration "Debug" clean build test -destination "platform=iOS Simulator,name=iPhone 11,OS=13.2" -enableCodeCoverage YES'

        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
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
