FROM jenkins/inbound-agent:3085.vc4c6977c075a-3
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install
USER root

#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

#Base
RUN apt-get update && \ 
    apt-get install -y \
    wget  \
    p7zip-full \
    gpg \ 
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/* 

#Dotnet
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

#Install
RUN apt-get update && \
    apt-get install -qy --allow-unauthenticated \ 
    dotnet-sdk-5.0 \
    dotnet-sdk-6.0 \
    && rm -rf /var/lib/apt/lists/* 

USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools
