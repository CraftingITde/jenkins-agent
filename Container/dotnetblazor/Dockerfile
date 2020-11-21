FROM agent-dotnet
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"
 
# Install
USER root

#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
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


USER jenkins