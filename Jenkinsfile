node{
    stage("git clone"){
      git credentialsId: 'GITHUB', url: "https://github.com/dilanalib/tbbdevops.git"
    }
  
    stage("kubernetes dev deployment"){
      script{
          env.DOCKER_BUILD_NUMBER=Jenkins.instance.getItem("build").lastSuccessfulBuild.number
      }   
      sh 'echo ${DOCKER_BUILD_NUMBER}'
      sh 'envsubst < ./kubernetes-yamls/dev/mysql-deployment-dev.yaml | kubectl apply -f -'
      sh 'envsubst < ./kubernetes-yamls/dev/python-deployment-dev.yaml | kubectl apply -f -'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/mysql-pv-dev.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/mysql-pvc-dev.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/mysql-secret-dev.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/mysql-initdb-config-dev.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/mysql-service-dev.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/dev/python-service-dev.yaml'
    }
 
    stage("kubernetes test deployment"){
      def deployment = input(message:'TEST DEPLOY?', ok:'ok', parameters:[booleanParam(defaultValue:true,description:'',name:'yes')])
      if(deployment == true){
      script{
          env.DOCKER_BUILD_NUMBER=Jenkins.instance.getItem("build").lastSuccessfulBuild.number
      }   
      sh 'echo ${DOCKER_BUILD_NUMBER}'
      sh 'envsubst < ./kubernetes-yamls/test/mysql-deployment-test.yaml | kubectl apply -f -'
      sh 'envsubst < ./kubernetes-yamls/test/python-deployment-test.yaml | kubectl apply -f -'
      sh 'kubectl apply -f ./kubernetes-yamls/test/mysql-pv-test.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/test/mysql-pvc-test.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/test/mysql-secret-test.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/test/mysql-initdb-config-test.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/test/mysql-service-test.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/test/python-service-test.yaml'
      } else {
          echo "Deploy Skipped"
      }
    }

      stage("kubernetes prod deployment"){
      def deployment = input(message:'PROD DEPLOY?', ok:'ok', parameters:[booleanParam(defaultValue:true,description:'',name:'yes')])
      if(deployment == true){
      script{
          env.DOCKER_BUILD_NUMBER=Jenkins.instance.getItem("build").lastSuccessfulBuild.number
      }   
      sh 'echo ${DOCKER_BUILD_NUMBER}'
      sh 'envsubst < ./kubernetes-yamls/prod/mysql-deployment-prod.yaml | kubectl apply -f -'
      sh 'envsubst < ./kubernetes-yamls/prod/python-deployment-prod.yaml | kubectl apply -f -'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/mysql-pv-prod.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/mysql-pvc-prod.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/mysql-secret-prod.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/mysql-initdb-config-prod.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/mysql-service-prod.yaml'
      sh 'kubectl apply -f ./kubernetes-yamls/prod/python-service-prod.yaml'
      } else {
          echo "Deploy Skipped"
      }
    }
}
