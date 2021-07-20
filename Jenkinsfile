pipeline {
	environment {
	   JAVA_TOOLS_OPTIONS = "-Duser.home=/var/maven"
	}
	agent {
        docker {
            image 'maven:3.6.0-jdk-13'
            args '-v /temp/var/maven:/.m2 -e MAVEN_CONFIG=/var/maven/.m2'
        }
    }
    stages {
        stage('Build Jar') {
            steps {
                sh 'mvn clean package -DskipTests'
		    echo 'Run Tests 1'
		    sh "chmod +x -R ${env.WORKSPACE}"
		    sh './var/jenkins_home/workspace/JAVA_BUILD/healthcheck.sh'
            }
        }
        stage('Run Tests') {
            steps {
               echo 'Run Tests'
            }
        }
    }
  
}
