FROM centos:7.6.1810

ARG MAVEN_VERSION=3.3.9
ARG JAVA_VERSION=11
ARG JAVA_PACKAGE_VERSION=11.0.3.7-0

ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-${JAVA_PACKAGE_VERSION}

RUN yum -y update && \
	yum install -y java-${JAVA_VERSION}-openjdk-devel wget && \
	cd /opt && \
	wget -q http://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
        tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
        ln -s apache-maven-${MAVEN_VERSION} maven
