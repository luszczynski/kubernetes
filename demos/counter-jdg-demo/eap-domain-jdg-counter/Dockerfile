FROM luszczynski/eap-domain

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

COPY software/contador2.war /opt/jboss/eap/
COPY support/domain.xml $EAP_HOME/domain/configuration/domain.xml
COPY support/*.sh /opt/jboss/eap/