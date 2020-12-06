#!/bin/sh
# Developed by Bruno Bigotto

# Update badge in repository using https://shields.io/ in gitLab!
# Status can be running, failed or passed
# Arguments: 
# environment (production, staging, develop)
# status (running, passed, failed)
# badgeId (https://gitlab.com/api/v4/projects/:projectId/badges)
# tokenApi (https://gitlab.com/-/profile/.personal_access_tokens)
# projectId 

env=$1
status=$2
badgeId=$3
tokenApi=$4
projectId=$5

echo "Updating the $env badge to status $status..."
if [ $status == running ]
then
    color=yellow
elif [ $status == passed ]
then
    color=brightgreen
else
    color=red
fi

badgerUrl="https://img.shields.io/badge/$env-$status-$color"

curl --silent --output nul --request PUT https://gitlab.com/api/v4/projects/$projectId/badges/$badgeId?image_url=$badgerUrl \
--header PRIVATE-TOKEN:$tokenApi \

echo "Updated!"