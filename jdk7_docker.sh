#!/bin/bash
yum update -y
cd /root/Downloads/
yum install -y git sudo which lynx
mv jdk1.7.0_80/ /opt/java
cd /opt/java
alternatives --install /usr/bin/java java /opt/java/bin/java 2
yes 1|alternatives --config java 
alternatives --install /usr/bin/jar jar /opt/java/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/java/bin/javac 2
alternatives --set jar /opt/java/bin/jar
alternatives --set javac /opt/java/bin/javac

