FROM luszczynski/jon-agent

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

USER root

ENV JDG_ZIP_NAME jboss-datagrid-6.5.0-server.zip
ENV INSTALLDIR_JDG /opt/jboss/jdg
ENV JDG_HOME $INSTALLDIR_JDG/jboss-datagrid-6.5.0-server

RUN mkdir -p $INSTALLDIR_JDG

COPY software/$JDG_ZIP_NAME $SOFTWARE/

RUN unzip $SOFTWARE/$JDG_ZIP_NAME -d $INSTALLDIR_JDG/

COPY support/*.properties $JDG_HOME/standalone/configuration/

# Clean up
RUN rm -rf $SUPPORT && rm -rf $SOFTWARE

RUN chown -R jboss. $INSTALLDIR_JDG

WORKDIR $JDG_HOME

USER jboss

EXPOSE 8080 9990 11222 11211

CMD ["/opt/jboss/jdg/jboss-datagrid-6.5.0-server/bin/clustered.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
