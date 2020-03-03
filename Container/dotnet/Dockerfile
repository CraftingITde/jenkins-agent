FROM jenkins/jnlp-slave:4.0.1-1
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
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/* 

#Dotnet
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/debian/9/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list


#Install
RUN apt-get update && \
    apt-get install -qy --allow-unauthenticated \ 
    dotnet-sdk-2.2 \
    dotnet-sdk-3.0 \
    dotnet-sdk-3.1 \
    && rm -rf /var/lib/apt/lists/* 


#RUN chown -R jenkins:jenkins ~/.npm
#RUN chown -R jenkins:jenkins ~/.config

USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools