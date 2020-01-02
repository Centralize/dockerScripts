#! /bin/bash

newUser=$1
newDbPassword='GarageHest2020_'
newDb=$2
#host=localhost
host='%'

showSyntax() {
        echo "Thy-IT DB Creator"
        echo "------------------------------------"
        echo "Syntax: $0 <db user> <db name>"
        echo ""
}

if [ -z "$newUser" ]
then
        showSyntax
else
	commands="CREATE DATABASE \`${newDb}\`;CREATE USER '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT USAGE ON *.* TO '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT ALL privileges ON \`${newDb}\`.*
TO '${newUser}'@'${host}';FLUSH PRIVILEGES;"

	echo "${commands}" | /usr/bin/mysql -u root -p
fi
