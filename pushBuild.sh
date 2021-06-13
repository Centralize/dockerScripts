#!/usr/bin/bash

WEBSITE=$1
PATH="/root/wwwDev/$WEBSITE"

echo "Updating git repo"
git add *
git commit -m "Site updated"
git push

echo "Rebuilding docker image"
docker build -t openlabdk/$WEBSITE:v1 .
docker push openlabdk/$WEBSITE:v1
echo "Done."
