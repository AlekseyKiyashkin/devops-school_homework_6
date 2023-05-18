FROM ubuntu:20.04
ENV TZ=Europe/Belgrade 
LABEL maintainer="akiyashkin@gmail.com"

RUN apt update && apt install wget maven default-jdk -y
RUN apt install wget git -y

RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz -P /tmp
RUN tar -xvzf /tmp/apache-tomcat-10.1.8.tar.gz -C /opt

WORKDIR /opt/build
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git .
RUN mvn clean package && cp /opt/build/target/hello-1.0.war /opt/apache-tomcat-10.1.8/webapps

EXPOSE 8080
CMD ["/opt/apache-tomcat-10.1.8/bin/catalina.sh", "run"]