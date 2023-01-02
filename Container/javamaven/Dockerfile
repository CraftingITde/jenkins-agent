FROM jenkins/inbound-agent:3085.vc4c6977c075a-2-jdk11
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"


USER root


#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

RUN apt-get update && \ 
    apt-get install -y \
    --no-install-recommends \
    --allow-unauthenticated \
    maven \
    p7zip-full \
    && rm -rf /var/lib/apt/lists/* 

USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools