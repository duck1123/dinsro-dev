pipeline {
    agent{
        kubernetes {
            yamlFile 'KubernetesPod.yaml'
        }
    }

    environment {
        REGISTRY_BASE = ""
        REGISTRY = "${env.REGISTRY_BASE}duck1123/dinsro-dev"
        VERSION = "${env.GIT_BRANCH.replaceAll(/\//, "-")}-${env.BUILD_ID}"
        TZ = "America/Detroit"
    }

    stages {
        stage('init') {
            steps {
                stash 'files'

                node(POD_LABEL) {
                    container('builder') {
                        unstash 'files'

                        echo "Hello World"
                        sh "docker build -t ${env.REGISTRY}:${env.VERSION} ."
                    }
                }
            }
        }
    }
}
