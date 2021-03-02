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
}
