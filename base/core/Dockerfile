FROM centos:centos7

MAINTAINER Gustavo Luszczynski <gluszczy@redhat.com>

ENV TERM=xterm
ENV HOME=/home/jboss
ENV SUPPORT=$HOME/support
ENV SOFTWARE=$HOME/software

# Increase ulimit
RUN echo "* soft nofile 4096" >> /etc/security/limits.conf && \
	echo "* hard nofile 4096" >> /etc/security/limits.conf && \
	echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf && \
	echo "net.ipv4.icmp_echo_ignore_broadcasts = 0" >> /etc/sysctl.conf

RUN alias ls="ls --color" && \
	alias grep="grep --color=auto" && \
	alias ll="ls -l --color=auto"

RUN echo '%jboss ALL=(ALL) ALL' >> /etc/sudoers && \
	useradd -m -d /home/jboss -p jboss jboss  && \
	echo 'root:redhat' | chpasswd && \
	mkdir -p $SOFTWARE && mkdir -p $SUPPORT

RUN yum -y update && yum -y install epel-release

RUN yum -y install unzip sudo vim xterm net-tools openssh-server wget git bsdtar supervisor && yum clean all