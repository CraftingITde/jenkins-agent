FROM jenkins/inbound-agent:4.3-6
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install
USER root

#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

#Base
RUN apt-get update && \ 
    apt-get install -y \
    curl  \
    p7zip-full \
    && rm -rf /var/lib/apt/lists/* 

# NodeJS
RUN  curl -sL https://deb.nodesource.com/setup_10.x | bash -
#Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Install
RUN apt-get update && \
    apt-get install -qy --allow-unauthenticated \ 
    nodejs \
    yarn \
    make \
    && rm -rf /var/lib/apt/lists/* 


#RUN chown -R jenkins:jenkins ~/.npm
#RUN chown -R jenkins:jenkins ~/.config

USER jenkins

RUN yarn cache clean

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools