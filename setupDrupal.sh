#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2

showSyntax() {
        echo "Thy-IT Setup Drupal Container"
        echo "------------------------------------"
        echo "Syntax: $0 <Domain> <Customer name>     "
        echo ""
}

if [ -z "$vDomain" ]
then
        showSyntax
else
	echo "Starting creation process for $CustomerName."
	echo "Creating Wordpress Server for $CustomerName with access from the Domain: $vDomain."
	time docker run -ti --name $CustomerName-drupal -e VIRTUAL_HOST=$vDomain -d drupal:latest
	echo "Done."
fi
