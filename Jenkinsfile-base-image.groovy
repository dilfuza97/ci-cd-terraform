pipeline {
    agent {
        label "${params.base_image}"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    env.PACKAGES = "${params.packages}"
                }
                sh '''
                    # Install packages
                    apt-get update && apt-get install -y ${PACKAGES}
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    # Deploy your application
                '''
            }
        }
    }
    parameters {
        choice(
            name: 'base_image',
            choices: ['ubuntu:20.04', 'debian:10', 'centos:8'],
            description: 'Select the base image'
        )
        string(
            name: 'packages',
            defaultValue: '',
            description: 'Enter the packages to be installed, separated by spaces'
        )
        string(
            name: 'mem_requests',
            defaultValue: '',
            description: 'Enter the memory request for the container'
        )
        string(
            name: 'cpu_requests',
            defaultValue: '',
            description: 'Enter the CPU request for the container'
        )
        string(
            name: 'gpu_requests',
            defaultValue: '',
            description: 'Enter the GPU request for the container'
        )
    }
}
