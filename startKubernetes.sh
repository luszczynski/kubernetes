#!/bin/bash

for SERVICES in etcd kube-apiserver kube-controller-manager kube-scheduler; do 
    systemctl restart $SERVICES
    systemctl status $SERVICES 
done

for SERVICES in docker kube-proxy.service kubelet.service; do 
    systemctl restart $SERVICES
    systemctl status $SERVICES 
done