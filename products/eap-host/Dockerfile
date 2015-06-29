FROM luszczynski/eap

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

COPY support/host-slave.xml $EAP_HOME/domain/configuration/
COPY support/start.sh /home/jboss/start.sh

USER root
#RUN echo 'sed -i '\''s/name_host/'\''$(cat /etc/hostname)'\''/g'\'' $EAP_HOME/domain/configuration/host-slave.xml' >> $HOME/run.sh && \
#	echo 'sed -i '\''s/ip_jgroups/'\''$MYIP'\''/g'\'' $EAP_HOME/domain/configuration/host-slave.xml' >> $HOME/run.sh && \
#	echo 'runuser -l jboss -c "$EAP_HOME/bin/domain.sh --host-config=host-slave.xml --master-address=10.254.100.1 -b 0.0.0.0 -bmanagement $MYIP -bunsecure $MYIP"' >> $HOME/run.sh
	
#echo 'if [ "$#" -ne 1 ]; then' >> $HOME/run.sh && \
	#echo 'echo "Usage: $0 [host-controller name]" >&2' >> $HOME/run.sh && \
	#echo 'exit 1' >> $HOME/run.sh && \
	#echo 'fi' >> $HOME/run.sh && \	
	

RUN chown -R jboss. $EAP_HOME

EXPOSE 8080 9990 9999

CMD ["/home/jboss/start.sh"]
