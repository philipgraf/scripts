#!/bin/bash

user=xxx
password=xxx
template_database=xxx

new_database=$1

if [ $# != 1 ]
	then
	echo Usage: $0 databasename
	exit
fi


echo Create database $new_database
mysql -u $user -p$password -e "DROP DATABASE IF EXISTS $new_database" && mysql -u $user -p$password -e "CREATE DATABASE $new_database"

echo Cloning database $template_database to $new_database
mysqldump $template_database -u $user -p$password | mysql $new_database -u $user -p$password

