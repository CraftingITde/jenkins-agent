FROM jenkins/inbound-agent:4.11.2-2
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
    curl \
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
    dotnet-sdk-6.0 

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
#Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Install2
RUN apt-get update && \
    apt-get install -qy --allow-unauthenticated \ 
    nodejs \
    yarn \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/* 


USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools