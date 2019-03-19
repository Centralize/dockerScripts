#!/bin/bash

dialog --menu "Docker Script Menu" 12 40 5 1 "List containers" 2 "Start Proxy" 3 "Start existing containers" 4 "Add new domain" 5 "Remove Domain" 2> answer
CHOICE=`cat answer`

rm -rf answer

case $CHOICE in
	1)
		docker ps -a > containerlist
		;;
esac

dialog --textbox containerlist 40 160; 
rm -rf containerlist
