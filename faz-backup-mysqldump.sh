#!/bin/bash
#
# script simples para fazer mysqldump em um diretorio
# Exemplos de mysqldump e mysql:
# mysqldump -u <usuario> -p<senha> mysql user db func > mysqltables.sql
# mysql -u <usuario> -p<senha> < mysql.sql
# sidney - 18/12/2017


DIRBACKUP=backup
DATA=`date +%Y%m%d-%H%M%S`
MYSQLDUMP=/usr/bin/mysqldump
DATABASES="mysql "

echo "Executando dump em $DIRBACKUP/$DATA"
mkdir -p $DIRBACKUP/$DATA
for d in $DATABASES;
do
	echo "Backup de $d"
	$MYSQLDUMP $d > $DIRBACKUP/$DATA/$d.dump
done
