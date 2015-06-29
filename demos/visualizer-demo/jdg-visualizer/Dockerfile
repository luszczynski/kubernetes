FROM luszczynski/jdg

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

USER root

COPY support/clustered.xml $JDG_HOME/standalone/configuration/
COPY support/clustered.conf $JDG_HOME/bin/
COPY support/start.sh /home/jboss/start.sh

RUN chown -R jboss. $JDG_HOME

EXPOSE 8080 9990 9999 11222 11211

CMD ["/home/jboss/start.sh"]