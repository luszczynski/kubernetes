FROM luszczynski/jon-agent

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

ENV EAP_PATCH_NAME jboss-eap-6.4.1-patch.zip
ENV EAP_ZIP_NAME jboss-eap-6.4.0.zip
ENV INSTALLDIR_EAP /opt/jboss/eap
ENV EAP_HOME $INSTALLDIR_EAP/jboss-eap-6.4

RUN mkdir -p $INSTALLDIR_EAP && \
	chown -R jboss.jboss  $HOME $INSTALLDIR_EAP

USER jboss

COPY software/$EAP_ZIP_NAME $SOFTWARE/
COPY software/$EAP_PATCH_NAME $SOFTWARE/

RUN unzip $SOFTWARE/$EAP_ZIP_NAME -d $INSTALLDIR_EAP

COPY support/*.properties $EAP_HOME/standalone/configuration/
COPY support/*.properties $EAP_HOME/domain/configuration/

RUN $INSTALLDIR_EAP/jboss-eap-6.4/bin/jboss-cli.sh --user=admin --password=redhat@123 --controller=localhost "patch apply $HOME/software/$EAP_PATCH_NAME"

WORKDIR $EAP_HOME