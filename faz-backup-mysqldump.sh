#!/bin/bash
#
# script simples para fazer mysqldump em um diretorio
# Exemplos de utilizacao do mysqldump e mysql:
# mysqldump -u <usuario> -p<senha> mysql user db func > mysqltables.sql
# mysql -u <usuario> -p<senha> < mysql.sql
# sidney - 18/12/2017

source ./config.txt

echo "Executando dump em $DIRBACKUP/$DATA"
mkdir -p $DIRBACKUP/$DATA
for d in $DATABASES;
do
	echo "Backup de $d"
	$MYSQLDUMP -u $ADMIN -p$PASS $d > $DIRBACKUP/$DATA/$d.dump
done

echo "Removendo entradas antigas"
$FIND $DIRBACKUP -type d -ctime +$DIAS -exec rm -rf {} \; 
