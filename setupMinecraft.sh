#!/bin/bash
docker run --name="minecraft" -d -e "MEMORY=1024" -p 25565:25565 -v minecraft:/data thyit/minecraft:latest
