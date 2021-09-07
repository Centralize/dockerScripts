#!/usr/bin/bash

#set -xe

MENUTARGET='menuitems.lst'

menu() {
	ITEMS=`ls setup* |sed -r 's/^.{5}//'|cut -d '.' -f 1 > $MENUTARGET`
	while read -r line; do
		count=$((count+1))
		echo $count") $line"
	done < $MENUTARGET
}

menu
read USERINPUT


