#!/bin/bash
docker tag agent-docker craftingit/jenkins-agent-docker:$TRAVIS_TAG
docker tag agent-javamaven craftingit/jenkins-agent-javamaven:$TRAVIS_TAG
docker tag agent-javascript craftingit/jenkins-agent-javascript:$TRAVIS_TAG
docker tag agent-dotnet craftingit/jenkins-agent-dotnet:$TRAVIS_TAG
docker tag agent-releaser craftingit/jenkins-agent-releaser:$TRAVIS_TAG
docker tag agent-dotnetblazor craftingit/jenkins-agent-dotnetblazor:$TRAVIS_TAG
docker tag agent-javaandroid craftingit/jenkins-agent-javaandroid:$TRAVIS_TAG
docker tag agent-javaandroidcordova craftingit/jenkins-agent-javaandroidcordova:$TRAVIS_TAG



if [ ! "$TRAVIS_TAG" == "dev" ];
then
    docker tag agent-docker craftingit/jenkins-agent-docker:latest
    docker tag agent-javamaven craftingit/jenkins-agent-javamaven:latest
    docker tag agent-javascript craftingit/jenkins-agent-javascript:latest
    docker tag agent-dotnet craftingit/jenkins-agent-dotnet:latest
    docker tag agent-releaser craftingit/jenkins-agent-releaser:latest
    docker tag agent-dotnetblazor craftingit/jenkins-agent-dotnetblazor:latest
    docker tag agent-javaandroid craftingit/jenkins-agent-javaandroid:latest
docker tag agent-javaandroidcordova craftingit/jenkins-agent-javaandroidcordova:latest
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push craftingit/jenkins-agent-docker
docker push craftingit/jenkins-agent-javamaven
docker push craftingit/jenkins-agent-javascript
docker push craftingit/jenkins-agent-dotnet
docker push craftingit/jenkins-agent-releaser
docker push craftingit/jenkins-agent-dotnetblazor
docker push craftingit/jenkins-agent-javaandroid
docker push craftingit/jenkins-agent-javaandroidcordova