FROM centos:8.2.2004

ARG MAVEN_VERSION=3.6.3
ARG JAVA_VERSION=11
ARG JAVA_PACKAGE_VERSION=11.0.6.10-1

ENV M2_HOME=/opt/maven
ENV JAVA_HOME=/usr/lib/jvm/java-openjdk

RUN yum -y update && \
	yum install -y java-${JAVA_VERSION}-openjdk-devel wget && \
	cd /opt && \
	wget -q http://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
        tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
        ln -s apache-maven-${MAVEN_VERSION} maven && \
        ln -s /opt/maven/bin/mvn /usr/bin/mvn
