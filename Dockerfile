FROM ubuntu:20.04
ENV TZ=Europe/Belgrade 
LABEL maintainer="akiyashkin@gmail.com"

RUN apt update && apt install wget maven default-jdk -y
RUN apt install wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz -P /tmp
RUN tar -xvzf /tmp/apache-tomcat-10.1.8.tar.gz -C /opt

EXPOSE 8080
CMD ["/opt/apache-tomcat-10.1.8/bin/catalina.sh", "run"]