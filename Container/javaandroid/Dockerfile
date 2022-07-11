FROM jenkins/inbound-agent:4.9-1-jdk11
LABEL maintainer="Kai Struessmann <kstruessmann@craftingit.de>"

USER jenkins

RUN apt-get update && \ 
    apt-get install -y \
    --no-install-recommends \
    --allow-unauthenticated \
    wget \
    unzip \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

# Jenkins Preparation
RUN mkdir /tmp/workspace
RUN mkdir /tmp/workspace/JenkinsTools