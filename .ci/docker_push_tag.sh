#!/bin/bash
docker tag agent-docker craftingit/jenkins-agent-docker:$TRAVIS_TAG
docker tag agent-javamaven craftingit/jenkins-agent-javamaven:$TRAVIS_TAG
docker tag agent-nodejs craftingit/jenkins-agent-nodejs:$TRAVIS_TAG
docker tag agent-yarn craftingit/jenkins-agent-yarn:$TRAVIS_TAG

if [ ! "$TRAVIS_TAG" == "dev" ];
then
    docker tag agent-docker craftingit/jenkins-agent-docker:latest
    docker tag agent-javamaven craftingit/jenkins-agent-javamaven:latest
    docker tag agent-nodejs craftingit/jenkins-agent-nodejs:latest
    docker tag agent-yarn craftingit/jenkins-agent-yarn:latest
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push craftingit/jenkins-agent-docker
docker push craftingit/jenkins-agent-javamaven
docker push craftingit/jenkins-agent-nodejs
docker push craftingit/jenkins-agent-yarn