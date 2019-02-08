#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2
Application="opencart"

echo "Starting creation process for $CustomerName."

#SETUP vNETWORK
echo "Creating customer network for $CustomerName."
time docker network create $CustomerName-$Application-net

#SETUP MySQL Server
echo "Creating MySQL Server for $CustomerName with access only on $CustomerName-$Application-net."
time docker run -ti --name $CustomerName-mysql --network $CustomerName-$Application-net -e MYSQL_ROOT_PASSWORD=c7ad44cbad762a5da0a452f9 -p 3307:3306 -d mysql:latest

#SETUP Wordpress Server
echo "Creating $Application Server for $CustomerName with access from the Domain: $vDomain."
time docker run -ti --name $CustomerName-$Application --network $CustomerName-$Application-net -e DB_SERVER=$CustomerName-mysql -e VIRTUAL_HOST=$vDomain -d $Application:latest

echo "Done."
