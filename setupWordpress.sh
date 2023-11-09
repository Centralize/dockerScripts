#!/bin/bash

#set -x

#INPUT VARS
vDomain=$1
CustomerName=$2
newpass=$(pwgen -cnsB 16 1)
port=$(sudo netstat -lnput|grep -i ":3306")

if [ -z "$port" ]; then
	mysqlPort=3306
else
	mysqlPort=3307
fi

function syntax()
{
   echo "Syntax:"
   echo ""
   echo "$0 <vDomain> <CustomerName>"
   echo ""
}

if [ -z "$vDomain" ]; then
	echo "Syntax Error: vDomain is missing."
	echo ""; echo ""
	syntax
	exit 1
fi

if [ -z "$CustomerName" ]; then
	echo "Syntax Error: Customer name is missing."
	echo ""; echo ""
	syntax
	exit 1
fi

echo "Starting creation process for $CustomerName."

#SETUP vNETWORK
echo "Creating customer network for $CustomerName."
time docker network create $CustomerName-wordpress-net

#SETUP MySQL Server
echo "Creating MySQL Server for $CustomerName with access only on $CustomerName-wordpress-net."
time docker run -ti --name $CustomerName-mysql --network $CustomerName-wordpress-net -e MYSQL_ROOT_PASSWORD=$newpass -p $mysqlPort:3306 -d mysql:latest
echo "MySQL root password: $newpass"

#SETUP Wordpress Server
echo "Creating Wordpress Server for $CustomerName with access from the Domain: $vDomain."
time docker run -ti --name $CustomerName-wordpress --network $CustomerName-wordpress-net -e DB_SERVER=$CustomerName-mysql -e VIRTUAL_HOST=$vDomain -d wordpress:latest

echo "Done"
