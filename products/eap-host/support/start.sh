#!/bin/sh

sed -i "s/name_host/$HOSTNAME/g" $EAP_HOME/domain/configuration/host-slave.xml
sed -i "s/ip_jgroups/$HOSTNAME/g" $EAP_HOME/domain/configuration/host-slave.xml
runuser -l jboss -c "$EAP_HOME/bin/domain.sh --host-config=host-slave.xml --master-address=$EAP_DOMAIN_SERVICE_HOST -b 0.0.0.0 -bmanagement 0.0.0.0 -bunsecure 0.0.0.0"