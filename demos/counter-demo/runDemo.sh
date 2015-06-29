#!/bin/bash

function start() {
	kubectl create -f ews-counter/ews-counter-service.json
	kubectl create -f eap-domain-counter/eap-domain-counter-service.json
	kubectl create -f eap-host-counter/eap-host-counter-service.json

	kubectl create -f ews-counter/ews-counter-rc.json
	kubectl create -f eap-domain-counter/eap-domain-counter-rc.json
	kubectl create -f eap-host-counter/eap-host-counter-rc.json	
}

function stop() {
	kubectl stop -f ews-counter/ews-counter-service.json
	kubectl stop -f eap-domain-counter/eap-domain-counter-service.json
	kubectl stop -f eap-host-counter/eap-host-counter-service.json
	
	kubectl stop -f ews-counter/ews-counter-rc.json
	kubectl stop -f eap-domain-counter/eap-domain-counter-rc.json
	kubectl stop -f eap-host-counter/eap-host-counter-rc.json
}

case "$1" in
	start)
		start
	;;
	stop)
		stop
	;;
esac