#!/bin/bash

CONTAINERFILE=$1

while read line
do
	echo "Starting container $line..."
	docker start $line
done < $CONTAINERFILE
