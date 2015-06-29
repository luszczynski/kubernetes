#!/bin/sh

runuser -l jboss -c "$JDG_HOME/bin/clustered.sh -b $HOSTNAME -bmanagement $HOSTNAME -bunsecure $HOSTNAME -Djboss.node.name=$HOSTNAME"