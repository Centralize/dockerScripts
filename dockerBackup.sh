#!/bin/bash

CONTAINER=$1

showSyntax() {
	echo "Thy-IT Docker Backup Script"
	echo "---------------------------"
	echo "Syntax: $0 <container>"
	echo ""
}

if [ "$EUID" -ne 0 ]
	then echo "Please run as sudo"
fi

if [ -z "$CONTAINER" ]
then
	showSyntax
else
	echo "Backing up $CONTAINER to /BACKUP..."
	docker save -o /BACKUP/$CONTAINER.tar $CONTAINER

	echo "Compressing $CONTAINER backup..."
	gzip /BACKUP/$CONTAINER
	echo "Done."
fi
exit 0
