FROM luszczynski/core

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

ENV MAVEN_VERSION=3.2.5
ENV M2_HOME=$HOME/.m2

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | bsdtar xzf - -C /usr/share && \
	mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && \
	ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
	mkdir $M2_HOME && \
	chown -R jboss. $M2_HOME

RUN yum -y install java-1.7.0-openjdk-devel;yum clean all

ENV JAVA_HOME /usr/lib/jvm/jre