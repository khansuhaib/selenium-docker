FROM openjdk:8u191-jre-alpine3.8
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host
# into this image
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs							libs

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

# ADD suite files
ADD search-module.xml					search-module.xml

# ADD health check script
ADD healthcheck.sh                      healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE

ENTRYPOINT sh healthcheck.sh
CMD while true; do sleep 1000; done
