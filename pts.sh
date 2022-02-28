#!/bin/bash

RED='\033[31;1m'
END='\033[m'

if ["$1" == ""]
then
	echo -e "Exemplo de uso ==> ${RED}192.168.0${END}"
else
	for x in {0..100}; do
		hping3 -S -p 1337 -c 1 $1.$x >> log.txt
	done
fi

echo -e "${RED}=========================================${END}"
sed '/flags=SA/!d' log.txt
echo -e "${RED}=========================================${END}"
sleep 1
rm log.txt
