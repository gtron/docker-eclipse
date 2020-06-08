FROM ubuntu
MAINTAINER Gianluca Mereu "docker-eclipse@gianlucamereu.it"

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get -y install \
    openjdk-11-jdk git sudo procps wget unzip ca-certificates curl libswt-gtk-4-java && \
    apt-get upgrade -y && apt-get -y autoremove && apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

ENV ECLIPSE_URL=http://mirror.dkm.cz/eclipse/technology/epp/downloads/release/2020-03/R/eclipse-java-2020-03-R-linux-gtk-x86_64.tar.gz

RUN wget $ECLIPSE_URL -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz

CMD /opt/eclipse/eclipse

