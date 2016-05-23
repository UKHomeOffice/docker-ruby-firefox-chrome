FROM quay.io/ukhomeofficedigital/ruby:2.3.0

ENV DISPLAY=":99.0" \
    CHROMEDRIVER_VERSION="2.21"

RUN yum update && yum install -y wget unzip firefox xorg-x11-server-Xvfb xorg-x11-font dejavu-sans-fonts \
    dejavu-serif-fonts lsb xdg-utils GConf2 libXss libXtst libXScrnSaver && \
    yum clean all

RUN wget -O /tmp/chrome.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    rpm -ivh /tmp/chrome.rpm

RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ && \
    chmod ugo+rx /usr/bin/chromedriver
