pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Kosalendra-Kalluri/Eks-cluster.git'
            }
        }

        stage('Set AWS Credentials') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                  credentialsId: 'aws-access',
                                  usernameVariable: 'AWS_ACCESS_KEY_ID',
                                  passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo "AWS credentials set."
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }


        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply the Terraform changes?', ok: 'yes'
                sh 'terraform apply'
            }
        }
    }
}
