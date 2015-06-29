#!/bin/sh

runuser -l jboss -c "/opt/jboss/eap/jboss-eap-6.4/bin/standalone.sh -b $HOSTNAME -bmanagement $HOSTNAME -bunsecure $HOSTNAME -c standalone.xml -Djdg.visualizer.jmxUser=admin -Djdg.visualizer.jmxPass=redhat@123 -Djdg.visualizer.serverList=$JDG_VISUALIZER_SERVICE_HOST:$JDG_VISUALIZER_SERVICE_PORT"