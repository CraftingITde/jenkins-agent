FROM jenkins/jnlp-slave:3.29-1
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
    && rm -rf /var/lib/apt/lists/* 
  
# Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update && \
    apt-get install -qy docker-ce \
    && rm -rf /var/lib/apt/lists/* 

#RUN  usermod -aG docker jenkins


#RUN   chown jenkins:jenkins /home/jenkins/.docker -R
#RUN   chmod g+rwx "jenkins/.docker" -R

#USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools