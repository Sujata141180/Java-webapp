

node{
    stage("Checkout SCM"){
        
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/mahadevops12/Java-webapp.git']]])
    }
    stage("Build"){
        mvnHome= tool 'maven3'
        sh "${mvnHome}/bin/mvn clean install"
        
    }
    stage("Test"){
        sh "mvn test"
     
    }
    
    stage("Sonar Analysis"){
        
        withSonarQubeEnv ('mySonar'){
            sh 'mvn sonar:sonar'
        }
    }
   //  stage("Quality Gate"){
     //timeout(time: 1, unit: 'MINUTES') {
      //def qg = waitForQualityGate()
       //if (qg.status != 'OK') {
         //  error "Pipeline aborted due to quality gate failure: ${qg.status}"
           // }
          //}
        //}
    
 stage("Nexus Artifacts publish"){
        nexusPublisher nexusInstanceId: '12345', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/my-webapp.war']], mavenCoordinate: [artifactId: 'my-webapp', groupId: 'com.mycompany.app', packaging: 'war',, version: '1.3']]]
            
    }
    stage("mytest"){
    echo "Heloo from mytest"
    }
}

node('dev'){
    
    echo "Hello"
    sh "rm -rf *.war"
    sh "wget http://35.231.211.175:8081/repository/maven-releases/com/mycompany/app/my-webapp/1.3/my-webapp-1.3.war"
    sh "cp my-webapp-1.3.war  /var/lib/tomcat8/webapps/"
}












