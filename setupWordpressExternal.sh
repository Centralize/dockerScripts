#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2

showSyntax() {
        echo "Thy-IT Setup Wordpress Container"
        echo "------------------------------------"
        echo "Syntax: $0 <Domain> <Customer name>     "
        echo ""
}

if [ -z "$vDomain" ]
then
        showSyntax
else
	echo "Starting creation process for $CustomerName."
	#SETUP Wordpress Server
	echo "Creating Wordpress Server for $CustomerName with access from the Domain: $vDomain."
	time docker run -ti --name $CustomerName-wordpress -e VIRTUAL_HOST=$vDomain -d wordpress:latest
	echo "Done."
fi
