FROM ubuntu:20.04

LABEL maintainer="akiyashkin@gmail.com"

#Install needed packages
RUN apt update && apt install wget -y

#download tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz -P /tmp
RUN tar -xvzf /tmp/apache-tomcat-10.1.8.tar.gz -C /opt

EXPOSE 8080
CMD ["/opt/apache-tomcat-10.1.8/bin/catalina.sh", "run"]