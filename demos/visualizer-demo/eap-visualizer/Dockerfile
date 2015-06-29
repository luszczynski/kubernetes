FROM luszczynski/eap-standalone

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

USER root

COPY support/*.war /opt/jboss/eap/jboss-eap-6.4/standalone/deployments/jdg-visualizer.war
COPY support/start.sh /home/jboss/start.sh

RUN chown jboss. /opt/jboss

EXPOSE 8080 9990 9999

ENTRYPOINT ["/home/jboss/start.sh"]