#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE

echo "Checking if hub is ready - $HUB_HOST"

#while [ "$( curl -s http://$HUB_HOST:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
#do
#	sleep 1
#done
cd /var/jenkins_home/workspace/JAVA_BUILD
# start the java command
java -cp /target/selenium-docker.jar:/target/selenium-docker-tests.jar:/target/libs/* \
    -DHUB_HOST=$HUB_HOST \
    -DBROWSER=$BROWSER \
    org.testng.TestNG /target/libs/$MODULE
