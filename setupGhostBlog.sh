#!/bin/bash

#INPUT VARS
vDomain=$1
CustomerName=$2

echo "Starting creation process for $CustomerName."

#SETUP Wordpress Server
echo "Creating Ghost Server for $CustomerName with access from the Domain: $vDomain."
time docker run -ti --name $CustomerName-ghost -e VIRTUAL_HOST=$vDomain -d ghost:latest

echo "Done."
