#!/bin/bash

CONTAINER_DIR=$(find . -maxdepth 3 -name "$2" | sed 's/.\///')

RC=$(find $CONTAINER_DIR -name "*-rc.*")
SERVICE=$(find $CONTAINER_DIR -name "*-service.*")

case "$1" in
	start)
		kubectl create -f $SERVICE
		kubectl create -f $RC
	;;
	stop)
		kubectl stop -f $SERVICE
		kubectl stop -f $RC	
	;;
esac