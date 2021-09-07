FROM jenkins/inbound-agent:4.10-1
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
    
 # Fix .net5 CA Fail
RUN echo "deb http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y --no-install-recommends \
     ca-certificates \
&& rm -rf /var/lib/apt/lists/* \
&& sed -i '$ d' /etc/apt/sources.list

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
    dotnet-sdk-5.0 \
    && rm -rf /var/lib/apt/lists/* 

USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools
