#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2
Application=$3
Repo=$4

showSyntax() {
	echo ""
        echo "Thy-IT Setup Simple Container Script"
        echo "------------------------------------------------------------"
        echo "Syntax: $0 <domain> <customername> <application name> <application image>  "
        echo ""
}

if [ -z "$vDomain" ]; then
	showSyntax
	exit 0
fi

echo "Starting creation process for $CustomerName."

#SETUP vNETWORK
echo "Creating customer network for $CustomerName."
time docker network create $CustomerName-$Application-net

#SETUP MySQL Server
echo "Creating MySQL Server for $CustomerName with access only on $CustomerName-$Application-net."
time docker run -ti --name $CustomerName-mysql --network $CustomerName-$Application-net -e MYSQL_ROOT_PASSWORD=c7ad44cbad762a5da0a452f9 -p 3307:3306 -d mysql:latest

#SETUP Wordpress Server
echo "Creating $Application Server for $CustomerName with access from the Domain: $vDomain."
time docker run -ti --name $CustomerName-$Application --network $CustomerName-$Application-net -e DB_SERVER=$CustomerName-mysql -e VIRTUAL_HOST=$vDomain -d $Repo

echo "Done."
