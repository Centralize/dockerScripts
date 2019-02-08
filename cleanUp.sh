#!/bin/bash

vDomain=$1
HEXID=`docker ps | grep "$vDomain" | cut -d ' ' -f 1`

docker stop $HEXID; docker rm $HEXID
