yum update -y
echo "[dockerrepo]" >> /etc/yum.repo.d/docker.rep
echo "name=Docker Repo" >> /etc/yum.repo.d/docker.rep
echo "baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/" >> /etc/yum.repo.d/docker.rep
echo "enabled=1" >> /etc/yum.repo.d/docker.rep
echo "gpgcheck=1" >> /etc/yum.repo.d/docker.rep
echo "gpgkey=https://yum.dockerproject.org/gpg" >> /etc/yum.repo.d/docker.rep

yum update -y
yum install -y docker-engine
yum install -y git wget

mkdir -p docker/download
cd docker/download/
mv /home/diarmuid/Downloads/* .
tar zxvf jdk-7u80-linux-x64.tar.gz 
tar zxvf jdk-8u121-linux-x64.tar.gz 
docker ps
docker images
docker run -it --name=jdk7 -v /root/docker/downloads:/root/Downloads centos:centos6 /bin/bash
docker ps -a
docker commit jdk7 centos6:java7
docker run -it --name=jdk8 -v /root/docker/download:/root/Downloads centos:centos6 /bin/bash
docker commit jdk8 centos6:java8

docker run -it --name=java7tomcat7 -v /root/docker/download:/root/Downloads -p 8180:8080 centos6:java7 /bin/bash
docker commit java7tomcat7 centos6:jdk7tomcat7
docker run -it --name=java7tomcat8 -v /root/docker/download:/root/Downloads -p 8180:8080 centos6:java7 /bin/bash
docker commit java7tomcat8 centos6:jdk7tomcat8


docker run -it --name=java8tomcat7 -v /root/docker/download:/root/Downloads -p 8180:8080 centos6:java8 /bin/bash
docker commit java8tomcat7 centos6:jdk8tomcat7
docker run -it --name=java8tomcat8 -v /root/docker/download:/root/Downloads -p 8180:8080 centos6:java8 /bin/bash
docker commit java8tomcat8 centos6:jdk8tomcat8


docker run -it --name=tomcatweb7 -v /root/docker/download:/root/Downloads -p 8180:8080 -e JAVA_HOME=/opt/java -e JRE_HOME=/opt/java centos6:jdk7tomcat7 /bin/bash

docker run -dit --name=jdk7tomcatweb7 -v /root/docker/download:/root/Downloads -p 8180:8080 -e JAVA_HOME=/opt/java -e JRE_HOME=/opt/java centos6:jdk7tomcat7 /bin/bash
docker run -dit --name=jdk7tomcatweb8 -v /root/docker/download:/root/Downloads -p 8181:8080 -e JAVA_HOME=/opt/java -e JRE_HOME=/opt/java centos6:jdk7tomcat8 /bin/bash
docker run -dit --name=jdk8tomcatweb7 -v /root/docker/download:/root/Downloads -p 8182:8080 -e JAVA_HOME=/opt/java -e JRE_HOME=/opt/java centos6:jdk8tomcat7 /bin/bash
docker run -dit --name=jdk8tomcatweb8 -v /root/docker/download:/root/Downloads -p 8183:8080 -e JAVA_HOME=/opt/java -e JRE_HOME=/opt/java centos6:jdk8tomcat8 /bin/bash

docker attach jdk8tomcatweb7
cd /root/Downloads
cp sample.war /opt/tomcat/webapps
/opt/tomcat/bin/startup.sh

