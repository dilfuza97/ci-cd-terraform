node {
  
  def image
  def mvnHome = tool 'Maven'

  
     stage ('checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[
                name: 'main']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [],
                submoduleCfg: [],
                userRemoteConfigs:[[
                    // credentialsId: 'githubcred',
                    url: 'https://github.com/qodirovshohijahon/jenkins-ci-cd-eks.git/'
                ]]
        ])
    }
    
    stage ('Build') {
            sh 'mvn -f pom.xml clean install'            
    }
        
    stage ('archive') {
            archiveArtifacts '**/*.jar'
    }
        
  
    
    stage ("Terraform init") {
        sh ('pwd && ls -lat && terraform -chdir="./terraform" init') 
    }

    stage ("Terraform plan") {
        sh ('terraform -chdir="./terraform" plan') 
    }

    stage ('Terraform Deploy using Kubectl') {
          sh 'terraform -chdir="./terraform" apply --auto-approve'
    }
}
