#!/bin/bash
yum update -y
cd /root/Downloads/
yum install -y git sudo which lynx
mv jdk1.7.0_80/ /opt/java
cd /opt/java
alternatives --install /usr/bin/javac javac /opt/java/bin/javac 2
alternatives --set jar /opt/java/bin/jar
alternatives --set javac /opt/java/bin/javac

