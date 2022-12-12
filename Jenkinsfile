pipeline {
    agent {
        label 'terraform-agent'
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION = credentials('AWS_REGION')
    }
 /*Test file */
    stages{
        stage('Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checking SCM') {
            steps {
                checkout scm
            }
        }

        /*stage('Terraform init') {
            steps {
                dir('G:/Dev/Github/IaC-DevOps-Challenge') {
                powershell 'terraform init'
                }
            }
        }*/

        stage('Terraform plan') {
           /* when{
                branch "Dev"
            } */
            steps {
                dir('/home/ubuntu-baselocal/curso-ansible/dev/Configuration-Management
') {
                sh 'terraform plan'
                echo "final"   
                }
                       
            }
        }
/*Test2*/
        stage('Terraform apply') {
            when{
                branch "main"
            }
            steps {
                dir('/home/ubuntu-baselocal/curso-ansible/dev/Configuration-Management') {
                sh 'terraform apply --auto-approve'
                }
                
                       
            }
        }    


        stage('5 minutes Terraform destroy') {
            when{
                branch "main"
            }
            steps {

                sh 'sleep 300'

                dir('/home/ubuntu-baselocal/curso-ansible/dev/Configuration-Management') {
                sh 'terraform destroy --auto-approve'
                }
                
                       
            }
        }

        
    }

}