FROM centos:8.4.2105

ARG JAVA_VERSION=11
ARG JAVA_PACKAGE_VERSION=11.0.8.10-1

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum -y update && \
    yum install -y java-${JAVA_VERSION}-openjdk-devel maven
