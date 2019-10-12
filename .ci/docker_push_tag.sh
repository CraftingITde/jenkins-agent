#!/bin/bash
docker tag agent-docker craftingit/jenkins-agent-docker:$TRAVIS_TAG

if [ ! "$TRAVIS_TAG" == "dev" ];
then
    docker tag agent-docker craftingit/jenkins-agent-docker:latest
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push craftingit/jenkins-agent-docker