#!/bin/bash

# Check whether app container is exist
docker ps |grep hello-devops-1
if [ $? -eq 0 ]
then
   docker stop hello-devops-1 && docker rm -v hello-devops-1
fi

# Start app container with latest image
docker run -d --name hello-devops-1 -p 9081:8080 ${APP_IMG}
