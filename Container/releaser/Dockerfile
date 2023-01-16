FROM jenkins/inbound-agent:3085.vc4c6977c075a-3
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install
USER root

#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

#Base
RUN apt-get update && \ 
    apt-get install -y \
    --no-install-recommends \
    --allow-unauthenticated \
    apt-transport-https \
    ca-certificates \
    curl \ 
    gnupg2 \
    software-properties-common \
    p7zip-full \
    jq \
    && rm -rf /var/lib/apt/lists/* 

#USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools