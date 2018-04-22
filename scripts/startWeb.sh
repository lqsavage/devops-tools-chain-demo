#!/bin/bash

# Check whether result container is exist
docker ps |grep result-devops-1
if [ $? -eq 0 ]
then
   docker stop result-devops-1 && docker rm -v result-devops-1
fi

# Start app container with latest test result file
docker run -d --name result-devops-1 -p 9091:80 -v /website-1:/usr/share/nginx/html nginx:alpine
