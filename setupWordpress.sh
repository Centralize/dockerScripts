#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2

echo "Starting creation process for $CustomerName."

#SETUP vNETWORK
echo "Creating customer network for $CustomerName."
time docker network create $CustomerName-wordpress-net

#SETUP MySQL Server
echo "Creating MySQL Server for $CustomerName with access only on $CustomerName-wordpress-net."
time docker run -ti --name $CustomerName-mysql --network $CustomerName-wordpress-net -e MYSQL_ROOT_PASSWORD=c7ad44cbad762a5da0a452f9 -p 3307:3306 -d mysql:latest

#SETUP Wordpress Server
echo "Creating Wordpress Server for $CustomerName with access from the Domain: $vDomain."
time docker run -ti --name $CustomerName-wordpress --network $CustomerName-wordpress-net -e DB_SERVER=$CustomerName-mysql -e VIRTUAL_HOST=$vDomain -d wordpress:latest

echo "Done"
