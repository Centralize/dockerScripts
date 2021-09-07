#!/bin/bash

#INPUT VARS
vDomain=$1

echo "Creating Redmine Server on the Domain: $vDomain."
time docker run -ti --name redmine -e VIRTUAL_HOST=$vDomain -p 3300:3000 -d redmine:latest

echo "Done"
