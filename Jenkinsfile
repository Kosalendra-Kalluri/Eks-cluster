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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding'
                                  credentialsId: 'aws-access'
                                  ]]) {
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
