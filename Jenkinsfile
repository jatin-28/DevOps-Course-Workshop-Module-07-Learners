pipeline {
    agent none

    stages {
        stage('Run Tests') {
            parallel {
                stage('Back-end') {
                    environment {
                        DISABLE_AUTH = 'true'
                        DB_ENGINE = 'sqlite'
                        DOTNET_CLI_HOME = '/tmp/DOTNET_CLI_HOME'
                    }

                    agent {
                        docker { image 'mcr.microsoft.com/dotnet/sdk:3.1' }
                    }
                    steps {
                        sh 'dotnet build'
                        sh 'dotnet test'
                    }
                }

                stage('Front-end') {
                    agent {
                        docker { image 'node:14-alpine' }
                    }
                    steps {
                        dir('DotnetTemplate.Web') {
                            sh 'npm install'
                            sh 'npm run build'
                            sh 'npm t'
                            sh 'npm run lint'
                        }

                    }
                }
            }
        }
    }
}
