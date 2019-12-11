FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install wget --yes
RUN apt-get install openjdk-8-jre --yes
RUN apt-get install zip --yes
RUN apt-get install curl     --yes
RUN apt-get install git --yes
COPY dependency/cf /usr/local/bin
COPY dependency/jq /usr/local/bin
WORKDIR /home
RUN wget -q https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.1.1.tgz
RUN tar -xvzf apache-jmeter-5.1.1.tgz
RUN export PATH=/home/apache-jmeter-5.1.1/bin:$PATH
COPY dependency/cmdrunner-2.0.jar apache-jmeter-5.1.1/lib
#RUN mkdir /home/cpi
#COPY app.sh /home/cpi/
#WORKDIR /home/cpi
