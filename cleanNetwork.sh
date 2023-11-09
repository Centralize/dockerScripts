#!/bin/bash

customer=$1

if [ -z "$customer" ]; then
	echo "Syntax error:"
	echo ""
	echo "Syntax: $0 <CustomerName>"
	echo ""
	exit 1
fi

HEXID=`docker network ls | grep -i "$customer" | cut -d ' ' -f 1`

if [ "$HEXID" == "" ]; then
	echo "Customer Network not found."
	exit 1
fi

docker network rm $HEXID
docker network ls
exit 0
