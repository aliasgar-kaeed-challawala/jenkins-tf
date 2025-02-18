pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
            when {
                branch 'master'
            }
            steps {
                input message: 'Do you want to apply this plan?'
            }
        }
        
        stage('Terraform Apply') {
            when {
                branch 'master'
            }
            steps {
                unstash 'terraform-plan'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
