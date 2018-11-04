pipeline {
    agent any
    stages{
        stage("Run Old Job"){
            steps{
                build job: 'AWS_KEY', parameters: [string(name: 'REGION', value: "${REGION}"), string(name: 'SSHKEY', value: "${SSHKEY}")]
            }
        }
        stage("Pull repo"){
            steps{
                git "git@github.com:farrukh90/terraform_jenkins_instance.git"
            }
        }
        stage("Terraform init"){
            steps{
                sh "cd ${workspace}"
                sh "terraform init"  
            }
        }
        stage("Terraform plan"){
            steps{
                sh 'terraform plan -var region="${REGION}"  -var count="${COUNT}" -var instancetype="${TYPE}"  -var SSHKEY="${SSHKEY}" -out=instance'
            }
        }
        stage("Input from User"){
            steps{
                input "Should I move on?"
            }
        }
        stage("Apply"){
            steps{
                sh "terraform apply -input=false instance"
            }
        }
    }
}
