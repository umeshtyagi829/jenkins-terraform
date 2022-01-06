  pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY     = credentials('aws_access_key')
        AWS_SECRET_KEY     = credentials('aws_secret_key')
        AWS_REGION         = "us-east-2"
    }
    stages {
      stage('Terraform Init&Plan') {
        steps {
          sh ('terraform init')
          sh ('terraform plan -var region="$AWS_REGION" -var aws_access_key="$AWS_ACCESS_KEY" -var aws_secret_key="$AWS_SECRET_KEY"')
        }      
      }

      stage('Terraform Apply') {
        steps {
          script {
            env.userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
            if (env.userInput == true){
              sh ('terraform apply --auto-approve -var region="$AWS_REGION" -var aws_access_key="$AWS_ACCESS_KEY" -var aws_secret_key="$AWS_SECRET_KEY"')
            }
            else{
              echo "Deployment cancelled"
            }
          }
        }
      }
    }
  }