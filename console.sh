#!/bin/bash

HOSTID=$1
COMMAND=$2

showSyntax() {
        echo "Thy-IT Container Console Script"
        echo "------------------------------------"
        echo "Syntax: $0 <Container> <Command>    "
        echo ""
}

if [ -z "$HOSTID" ]
then
        showSyntax
	exit 0
else
        docker exec -it $HOSTID $COMMAND
fi
