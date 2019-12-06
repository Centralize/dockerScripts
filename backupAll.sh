#!/bin/bash

set -x

CONTAINERFILE=$1
TODAY=$(date '+%d-%m-%Y')

docker ps | cut -d ' ' -f 1 | tail -n +2 > $CONTAINERFILE

#Create Images
while read line
do
	echo ""
	echo "Creating images $line..."
	docker commit -p $line $TODAY-backup-$line
done < $CONTAINERFILE

#Save Images to given path
while read line
do
	echo ""
	echo "Saving image $line to path $OUTPUTPATH"
	docker save -o $TODAY-backup-$line.tar $TODAY-backup-$line
done < $CONTAINERFILE

#Gzipping tar files
while read line
do
	echo ""
        echo "Gzipping image $line"
	gzip $TODAY-backup-$line.tar
done < $CONTAINERFILE

rm $CONTAINERFILE
