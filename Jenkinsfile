node('Slave_Mac') {

    stage('Checkout/Build/Test') {

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

        // Build and Test
        sh 'xcodebuild -scheme "TimeTable" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'

        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }
}
