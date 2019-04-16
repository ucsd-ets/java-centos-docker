FROM centos:7.5.1804

ARG MAVEN_VERSION=3.3.9 \
    JAVA_VERSION=1.8.0

ENV M2_HOME=/opt/maven \
    PATH=${M2_HOME}/bin:${PATH}
		JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

RUN yum -y update && \
	yum install -y java-${JAVA_VERSION}-openjdk-devel.x86_64 wget && \
	cd /opt && \
	wget -q http://www-eu.apache.org/dist/maven/maven-3/${3.3.9}/binaries/apache-maven-${3.3.9}-bin.tar.gz && \
        tar xzf apache-maven-${3.3.9}-bin.tar.gz && \
        ln -s apache-maven-${3.3.9} maven
