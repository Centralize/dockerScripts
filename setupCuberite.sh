#!/bin/bash

MCPORT=$1
WEBPORT=$2

showSyntax() {
        echo "Thy-IT Cuberite Container Script"
        echo "------------------------------------"
        echo "Syntax: $0 <Minecraft Port> <Webport>     "
        echo ""
}

if [ -z "$MCPORT" ]
then
        showSyntax
else
	echo "Starting Cuberite..."
	docker volume create cuberite-$MCPORT-data
	docker run --tty -d --name="mc-cuberite" -p $WEBPORT:8080 -p $MCPORT:25565 --volume=cuberite-$MCPORT-data beevelop/cuberite
	echo "Done."
fi
