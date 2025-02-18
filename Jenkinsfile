pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Branch') {
            steps {
                script {
                    println("Currently running on branch: ${env.BRANCH_NAME}")
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
                stash includes: 'tfplan', name: 'terraform-plan'
            }
        }

        stage('Approval') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main') {
                        input message: 'Do you want to apply this plan?'
                    } else {
                        echo "Approval skipped: Not on main branch."
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main') {
                        unstash 'terraform-plan'
                        sh 'terraform apply -auto-approve tfplan'
                    } else {
                        echo "Apply skipped: Not on main branch."
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() 
        }
    }
}
