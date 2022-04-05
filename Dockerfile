FROM centos:8.4.2105

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum -y update

ARG JAVA_VERSION=11
ARG JAVA_PACKAGE_VERSION=11.0.13.0.8-4.el8_5.x86_64

RUN yum install -y java-${JAVA_VERSION}-openjdk-${JAVA_PACKAGE_VERSION} java-${JAVA_VERSION}-openjdk-devel-${JAVA_PACKAGE_VERSION} maven
#  && \
#     which javac && \
#     java -version && \
#     javac -version && \
#     echo $PATH

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-${JAVA_PACKAGE_VERSION}
ENV PATH=${JAVA_HOME}/bin:${PATH}

# RUN java -version && \
#     javac -version && \
#     mvn -version && \
#     echo $PATH
