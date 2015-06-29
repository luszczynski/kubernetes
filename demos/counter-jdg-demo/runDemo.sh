#!/bin/bash

function start() {
	kubectl create -f jdg-counter/jdg-counter-service.json
	kubectl create -f ews-jdg-counter/ews-jdg-counter-service.json
	kubectl create -f eap-domain-jdg-counter/eap-domain-jdg-counter-service.json
	kubectl create -f eap-host-jdg-counter/eap-host-jdg-counter-service.json

	kubectl create -f jdg-counter/jdg-counter-rc.json
	kubectl create -f ews-jdg-counter/ews-jdg-counter-rc.json
	kubectl create -f eap-domain-jdg-counter/eap-domain-jdg-counter-rc.json
	kubectl create -f eap-host-jdg-counter/eap-host-jdg-counter-rc.json
}

function stop() {
	kubectl stop -f jdg-counter/jdg-counter-service.json
	kubectl stop -f ews-jdg-counter/ews-jdg-counter-service.json
	kubectl stop -f eap-domain-jdg-counter/eap-domain-jdg-counter-service.json
	kubectl stop -f eap-host-jdg-counter/eap-host-jdg-counter-service.json

	kubectl stop -f jdg-counter/jdg-counter-rc.json
	kubectl stop -f ews-jdg-counter/ews-jdg-counter-rc.json
	kubectl stop -f eap-domain-jdg-counter/eap-domain-jdg-counter-rc.json
	kubectl stop -f eap-host-jdg-counter/eap-host-jdg-counter-rc.json
}

case "$1" in
	start)
		start
	;;
	stop)
		stop
	;;
esac