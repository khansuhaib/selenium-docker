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

set projectLocation=/var/jenkins_home/workspace/JAVA_BUILD
cd %projectLocation%
set classpath=%projectLocation%/target:%projectLocation%/lib/*
java -DHUB_HOST=$HUB_HOST -DBROWSER=$BROWSER org.testng.TestNG %projectLocation%/search-module.xml


# start the java command
java -cp /var/jenkins_home/workspace/JAVA_BUILD/target/selenium-docker.jar:/var/jenkins_home/workspace/JAVA_BUILD/target/selenium-docker-tests.jar:/var/jenkins_home/workspace/JAVA_BUILD/target/libs/* \
    -DHUB_HOST=$HUB_HOST \
    -DBROWSER=$BROWSER \
    /var/jenkins_home/workspace/JAVA_BUILD/target/org.testng.TestNG $MODULE
