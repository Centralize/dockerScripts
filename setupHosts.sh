#!/bin/bash

HOSTNAME=$1

showSyntax() {
	echo "Thy-IT Setup Hosts Environment"
	echo "------------------------------"
	echo "Syntax: $0 <Hostname>         "
	echo ""
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as sudo"
  exit
fi

if [ -z "$HOSTNAME" ]
then
	showSyntax
else
	sudo echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
fi
