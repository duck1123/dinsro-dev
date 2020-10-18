pipeline {
    agent{
        kubernetes {
            yamlFile 'KubernetesPod.yaml'
        }
    }

    stages {
        stage('init') {
            steps {
                stash 'files'

                node(POD_LABEL) {
                    container('builder') {
                        unstash 'files'

                        echo "Hello World"
                    }
                }
            }
        }
    }
}
