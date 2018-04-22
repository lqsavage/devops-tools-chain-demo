env.SCM_URL = "https://github.com/yx1991523/devops-tools-chain-demo.git"
env.IMG_REG = "aura"
env.IMG_NAME = "${env.IMG_REG}/hello-devops-1"
env.IMG_TAG = "${env.BUILD_NUMBER}"
env.DEV_SERVER = "tcp://127.0.0.1:2375"

node {
       stage 'Clean Workspace'
             deleteDir()

       stage 'Checkout'
             git url: "${env.SCM_URL}"

       stage 'Unit Test'
              sh "mvn test -f docker/pom.xml"

       stage 'Build Jar'
              sh "mvn package -f docker/pom.xml -Dmaven.test.skip=true"

       stage 'Build Image'
              withDockerServer([uri: "${env.DEV_SERVER}"]) {
              sh "docker build -f Dockerfile -t ${env.IMG_NAME}:${env.IMG_TAG} ."
              }

       stage 'Deploy App'
              env.APP_IMG="${env.IMG_NAME}:${env.IMG_TAG}"
              withDockerServer([uri: "${env.DEV_SERVER}"]) {
              sh "export APP_IMG=${env.APP_IMG} && scripts/startApp.sh"
              }

       stage 'UI Test'
              sh 'docker restart f0211beddcc3 c386ae8dc472 && sleep 10 && python test.py && chmod -R 755 /website-1'

       stage 'Show Test'
              withDockerServer([uri: "${env.DEV_SERVER}"]) {
              sh "scripts/startWeb.sh"
              }
       }
