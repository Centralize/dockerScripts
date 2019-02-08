#!/bin/bash

customer=$1
HEXID=`docker network ls | grep "$customer" | cut -d ' ' -f 1`

docker network rm $HEXID
docker network ls
