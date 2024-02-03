// feature branch

pipeline {
    agent any

    environment {
             BRANCH_NAME = null
             FEATURE_CHECK_SUCCESS = null

           SCANNER_HOME = tool 'Sonar-scanner'
            // SONARQUBE_SCANNER_VERSION = '4.6.2.2472' // Update with the latest version
            SONARQUBE_HOST = 'http://localhost:5000' // Update with your SonarQube server URL
            SONARQUBE_PROJECT_KEY = 'demo-nodejs'

            NODE_VERSION = '14'
            APP_NAME = 'castV'
            DOCKER_REGISTRY = 'your-docker-registry'
            DOCKER_IMAGE_NAME = "${DOCKER_REGISTRY}/${APP_NAME}"
            DOCKER_IMAGE_TAG = "${DOCKER_IMAGE_NAME}:${semverMajorMinor()}-${env.BUILD_NUMBER}"
        
            }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Node.js project from version control
                checkout scm
            }
        }
        stage('Conditional Stage  ') {
            when {
                expression { return env.BRANCH_NAME =~ /^feature\/\d+$/ || env.COMMIT_MESSAGE =~ /feature/ }
            }
            steps {
                script {
                    echo 'Setting BRANCH_NAME to feature'
                    BRANCH_NAME = 'feature'
                }
            }
        }
        stage('SonarQube Scan') {
            when {
                expression { return BRANCH_NAME == 'feature' }
            }
            steps {
                script {
                  withSonarQubeEnv('SonarQube Server') {
                      // Run SonarQube analysis for Node.js
                      sh "sonar-scanner -Dsonar.host.url=${SONARQUBE_HOST} -Dsonar.projectKey=${SONARQUBE_PROJECT_KEY}"
                  }
                }
            }
        }
        stage('Quality Gate') {
            when {
                expression { return BRANCH_NAME == 'feature' }
            }
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
            when {
                expression { return BRANCH_NAME == 'feature' }
            }
            steps {
                script {
                    // Run Node.js unit tests
                    sh "npm install"
                    sh "npm test"
                    // Publish JUnit test results
                    junit '**/test-results.xml'
                    FEATURE_CHECK_SUCCESS = true

                }
            }
        }
        stage('Create a testing branch for feature x') {
            when {
                expression { return BRANCH_NAME == 'feature' &&  FEATURE_CHECK_SUCCESS == true  }
            }
            steps {
                // Your build steps go here
                echo 'creating and commit Testing x branch'
                git checkout -b testing/x
            }
        }
        

    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            // Cleanup or post-build actions go here
            echo 'Pipeline completed!'
        }

    }
}
