#!/bin/bash

ENV=$1

echo 'Replacing TEAM_ID'

sed -i  "s/<TEAM_ID>/${ENV}/g" scripts/startApp.sh
sed -i  "s/<TEAM_ID>/${ENV}/g" scripts/startWeb.sh
sed -i  "s/<TEAM_ID>/${ENV}/g" test.py
sed -i  "s/<TEAM_ID>/${ENV}/g" Jenkinsfile
