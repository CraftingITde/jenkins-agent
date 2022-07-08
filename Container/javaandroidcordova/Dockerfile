FROM jenkins/inbound-agent:4.9-1
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"


USER root

#Fix Apt Cache
RUN rm -rf /var/lib/apt/lists/* 

RUN apt-get upgrade

RUN apt-get update 
RUN apt-get install -y \
    --no-install-recommends \
    --allow-unauthenticated \
    wget \
    zip \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/* 

# Java
ENV JAVA_HOME_8 /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
ENV PATH $PATH:$JAVA_HOME_8/bin

RUN apt-get update
RUN apt install -y apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN apt install -y adoptopenjdk-8-hotspot

RUN update-alternatives --install "/usr/bin/java" "java" "$JAVA_HOME_8/bin/java"  1
RUN update-alternatives --install "/usr/bin/javac" "javac" "$JAVA_HOME_8/bin/javac"  1
RUN update-alternatives --install "/usr/bin/jar" "jar" "$JAVA_HOME_8/bin/jar"  1

RUN chown -R jenkins /var/lib/dpkg/alternatives/

# NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
#yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Install
RUN apt-get update && \
    apt-get install -qy --allow-unauthenticated \ 
    nodejs \
    yarn \
    make \
    build-essential \
    curl \
    python \
    && rm -rf /var/lib/apt/lists/* 

#Pip
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && python2 get-pip.py

#android sdk
ENV ANDROID_SDK_ZIP commandlinetools-linux-7583922_latest.zip
ENV ANDROID_SDK_ZIP_URL https://dl.google.com/android/repository/$ANDROID_SDK_ZIP
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux

ENV PATH $PATH:$ANDROID_SDK_ROOT/cmdline-tools/bin
ENV PATH $PATH:$ANDROID_SDK_ROOT/platform-tools

ADD $ANDROID_SDK_ZIP_URL /opt/
RUN unzip -q /opt/$ANDROID_SDK_ZIP -d $ANDROID_SDK_ROOT && rm /opt/$ANDROID_SDK_ZIP

RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;30.0.2"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-30"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;29.0.2"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-29"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;28.0.3"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-28"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;27.0.3"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-27"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;26.0.3"
RUN echo yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-26"

# Gradle PPA
ENV GRADLE_VERSION=6.3
ENV PATH=$PATH:"/opt/gradle/gradle-6.3/bin/"
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip -d /opt/gradle /tmp/gradle-*.zip \
    && chmod +775 /opt/gradle \
    && gradle --version \
    && rm -rf /tmp/gradle*

RUN chown -R jenkins $ANDROID_HOME
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Cordova
RUN yarn global add cordova
RUN cordova -v

#Frameworks
RUN yarn global add @quasar/cli \ 
    prettier \
    eslint \
    typescript \
    sharp\
    @vue/cli

RUN yarn cache clean

USER jenkins

RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools
WORKDIR /tmp/workspace
