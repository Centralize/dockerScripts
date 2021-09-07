#!/bin/bash

vDomain=$1

syntax() {
	echo "Syntax Error!"
	echo "-------------------------------------"
	echo "$0 <domain>"
	echo ""
}

if [ -z "$vDomain" ] 
then
	syntax
	exit 1
fi

HEXID=`docker ps | grep "$vDomain" | cut -d ' ' -f 1`
docker stop $HEXID; docker rm $HEXID
