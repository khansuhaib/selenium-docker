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

# start the java command
java -cp /var/jenkins_home/workspace/JAVA_BUILD/target/selenium-docker.jar:/var/jenkins_home/workspace/JAVA_BUILD/target/selenium-docker-tests.jar:/var/jenkins_home/workspace/JAVA_BUILD/target/libs/* \
    -DHUB_HOST=$HUB_HOST \
    -DBROWSER=$BROWSER \
    /var/jenkins_home/workspace/JAVA_BUILD/target/libs/org.testng.TestNG $MODULE
