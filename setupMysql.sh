#!/bin/bash

MYSQL_PASSWD=$1

showSyntax() {
	echo "Thy-IT MySQL Docker Startup Script"
	echo "----------------------------------"
	echo "Syntax: $0 <password>             "
	echo ""
}

if [ -z "$MYSQL_PASSWD" ]
then
	showSyntax
else
	docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=$MYSQL_PASSWD -p 3306:3306 --volume mariadb_data:/bitnami bitnami/mariadb:latest
fi
