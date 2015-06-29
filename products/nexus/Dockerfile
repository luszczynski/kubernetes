FROM luszczynski/java

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

ENV NEXUS_HOME /opt/nexus/nexus-2.11.3-01

COPY software/*.zip $SOFTWARE/nexus-2.11.3-01-bundle.zip

RUN unzip $SOFTWARE/nexus-2.11.3-01-bundle.zip -d /opt/nexus/

RUN chown -R jboss. /opt/nexus/

USER jboss

EXPOSE 8081

CMD ["/opt/nexus/nexus-2.11.3-01/bin/nexus", "console"]
