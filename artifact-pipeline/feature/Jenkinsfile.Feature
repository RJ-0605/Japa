// feature branch

pipeline {
    agent any

    environment {
            SCANNER_HOME = tool 'Sonar-scanner'
            // SONARQUBE_SCANNER_VERSION = '4.6.2.2472' // Update with the latest version
            SONARQUBE_HOST = 'http://localhost:9000' // Update with your SonarQube server URL
            SONARQUBE_PROJECT_KEY = 'your-node-app'
            }

    stages {
        stage('SonarQube Scan') {
            steps {
                script {
                  withSonarQubeEnv('SonarQube Server') {
                      // Run SonarQube analysis for Node.js
                      sh "sonar-scanner"
                  }
                }
            }
        }
        stage('Quality Gate') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-cred-token-id', installationName: 'Sonar') {
                        // Check Quality Gate status
                        sh "sonar-scanner -Dsonar.analysis.mode=preview -Dsonar.issuesReport.console.enable=true"
                        waitForQualityGate abortPipeline: true
                    }
                }
            }
        }
        stage('Run Unit Tests') {
            steps {
                script {
                    // Run Node.js unit tests
                    sh "npm install"
                    sh "npm test"
                    // Publish JUnit test results
                    junit '**/test-results.xml'
                }
            }
        }
        stage('Create a testing branch for feature x') {
            steps {
                // Your build steps go here
                echo 'Building the project...'
            }
        }
        

    }

    post {
        always {
            // Cleanup or post-build actions go here
            echo 'Pipeline completed!'
        }
    }
}
