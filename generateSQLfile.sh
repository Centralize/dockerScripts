#!/bin/bash

USERNAME=$1
PASSWORD=$2
HOSTNAME=$3

showSyntax() {
        echo "Username & Password Sourcefile Generator"
        echo "-------------------------------------------"
        echo "Syntax: $0 <username> <password> <hostname>"
        echo ""
}

if [ -z "$USERNAME" ]
then
	showSyntax
else
	file=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`

	TMPFILE="/tmp/$file.sql"

	touch $TMPFILE

	echo "CREATE USER '$USERNAME'@'$HOSTNAME' IDENTIFIED BY '$PASSWORD';" > $TMPFILE
	echo "GRANT ALL PRIVILEGES ON * . * TO '$USERNAME'@'$HOSTNAME';" >> $TMPFILE

	echo "source $TMPFILE"
fi
