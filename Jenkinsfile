pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kosalendra-Kalluri/Eks-cluster.git'
            }
        }

        stage('Set AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access']]) {
                    echo "AWS credentials set."
                }
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }


        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply the Terraform changes?', ok: 'yes'
                bat 'terraform apply'
            }
        }
    }
}
