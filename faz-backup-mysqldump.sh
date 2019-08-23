#!/bin/bash
#
# script simples para fazer mysqldump em um diretorio
# Exemplos de utilizacao do mysqldump e mysql:
# mysqldump -u <usuario> -p<senha> mysql user db func > mysqltables.sql
# mysql -u <usuario> -p<senha> < mysql.sql
# sidney - 18/12/2017

CONF=config.txt
if test -f "$CONF"; then
	echo "Executando dump em $DIRBACKUP/$DATA"
	mkdir -p $DIRBACKUP/$DATA
	for d in $DATABASES;
	do
		echo "Backup de $d"
		if $TEMSENHA;then
			$MYSQLDUMP -u $USER -p$PASS $d > $DIRBACKUP/$DATA/$d.dump
		else
			$MYSQLDUMP $d > $DIRBACKUP/$DATA/$d.dump
		fi
	done

	echo "Removendo entradas antigas"
	$FIND $DIRBACKUP -type d -ctime +$DIAS -exec rm -rf {} \; 
else
	echo "O arquivo $CONF nao existe"
	echo "Copie o arquivo config.txt.sample para config.txt e realize os ajustes necessarios."
fi

