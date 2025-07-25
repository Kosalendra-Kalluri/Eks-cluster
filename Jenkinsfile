pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access')
        AWS_SECRET_ACCESS_KEY = credentials('aws-access')
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kosalendra-Kalluri/Eks-cluster.git'
            }
        }

        stage('Set AWS Credentials') {
            steps {
                withAWS(credentials: 'aws-access', region: "ap-south-1") {
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
        stage('Terraform destroy'){
            steps{
                bat 'terraform destroy'
            }
        }
    }
}
