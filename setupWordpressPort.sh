#!/bin/bash

#INPUT VARS
CustomerName=$1
port=$2

showSyntax() {
        echo "Thy-IT Setup Wordpress Container"
        echo "------------------------------------"
        echo "Syntax: $0 <Customer name> <port>"
        echo ""
}

if [ -z "$CustomerName" ]
then
        showSyntax
else
	echo "Starting creation process for $CustomerName."
	#SETUP Wordpress Server
	echo "Creating Wordpress Server for $CustomerName with access on port: $port."
	time docker run -ti --name $CustomerName-wordpress -p $port:80 -d wordpress:latest
	echo "Done."
fi
