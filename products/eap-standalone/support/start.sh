#!/bin/bash

runuser -l jboss -c "$EAP_HOME/bin/standalone.sh -b $HOSTNAME -bmanagement $HOSTNAME -bunsecure $HOSTNAME -Djboss.node.name=$HOSTNAME $@"