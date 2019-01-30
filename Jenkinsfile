node{
    //properties([parameters([string(defaultValue: '1.2', description: '', name: 'ProjectVersion', trim: false)])])
    stage('Checkout SCM'){
        echo "Hello from git"
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/mahadevops12/Java-webapp.git']]])
    }
    stage('Build'){
        mvnHome = tool 'maven3'
        echo "Hello from Build"
        sh "$mvnHome/bin/mvn clean install"
    }
    stage('Test'){
        mvnHome = tool 'maven3'
        echo "Hello from Build"
        sh "$mvnHome/bin/mvn  test"
    }
       stage('Result'){
       archiveArtifacts 'target/my-webapp.war'
   }
    stage('Code Quality'){
        withSonarQubeEnv('mySonar'){
             sh 'mvn sonar:sonar'
        }
    }

   // stage('Upload to Nexus'){
     // nexusPublisher nexusInstanceId: '12345', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/my-webapp.war']], mavenCoordinate: [artifactId: 'my-webapp', groupId: 'com.mycompany.app', packaging: 'war', version: '$ProjectVersion']]]
    //}
    stage('Deploy to tomcat'){
        sh 'sudo cp target/*.war /var/lib/tomcat8/webapps'
        
    }
}
