FROM luszczynski/java

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

ENV INSTALLDIR_JON_AGENT=/opt/jboss/jon
ENV JON_AGENT_HOME=$INSTALLDIR_JON_AGENT/rhq-agent

COPY software/rhq-enterprise-agent-4.12.0.JON330GA.jar $SOFTWARE/
RUN mkdir -p $INSTALLDIR_JON_AGENT && java -jar $SOFTWARE/rhq-enterprise-agent-4.12.0.JON330GA.jar --install=$INSTALLDIR_JON_AGENT/
COPY support/agent-configuration.xml $JON_AGENT_HOME/conf/