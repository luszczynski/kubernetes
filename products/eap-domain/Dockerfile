FROM luszczynski/eap

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

COPY support/*.xml $EAP_HOME/domain/configuration/

USER jboss

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/eap/jboss-eap-6.4/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-bunsecure", "0.0.0.0", "--host-config=host-master.xml"]
