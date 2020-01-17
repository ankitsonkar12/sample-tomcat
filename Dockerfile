FROM ubuntu:latest
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
RUN wget http://muug.ca/mirror/apache-dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz
RUN tar xvfz apache-tomcat-8.5.50.tar.gz
RUN mv apache-tomcat-8.5.50/* /usr/local/tomcat
 
WORKDIR /usr/local/tomcat/webapps
COPY /target/SampleMavenTomcatApp.war /usr/local/tomcat/webapps
RUN ls -la /usr/local/tomcat/webapps/SampleMavenTomcatApp.war


EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
