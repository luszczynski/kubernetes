FROM luszczynski/eap

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

USER root

COPY support/start.sh $HOME/start.sh
RUN chmod +x $HOME/start.sh

EXPOSE 8080 9990 9999

ENTRYPOINT ["/home/jboss/start.sh"]