#!/bin/bash
cd /root/Downloads
tar zxvf apache-tomcat-7.0.73.tar.gz 
mv apache-tomcat-7.0.73/ /opt/tomcat

export JAVA_HOME=/opt/java
export JAVA_JRE=/opt/java
export CATALINA_BASE=/opt/tomcat
export CATALINA_HOME=/opt/tomcat
export CATALINA_IMPDIR=/opt/tomcat/temp

cd /opt/tomcat/bin
./startup.sh
curl http://localhost:8080
