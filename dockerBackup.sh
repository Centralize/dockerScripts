#!/bin/bash

CONTAINER=$1

echo "Backing up $CONTAINER to /BACKUP..."
docker save -o /BACKUP/$CONTAINER.tar $CONTAINER

echo "Compressing $CONTAINER backup..."
gzip /BACKUP/$CONTAINER

echo "Done."
exit 0
