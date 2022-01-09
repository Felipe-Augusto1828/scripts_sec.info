#! /bin/bash

RED='\033[31;1m'
GREEN='\033[32;1m'
BLUE='\033[34;1m'
YELLOW='\033[33;1m'
RED_BLINK='\033[31;5;1m'
END='\033[m'

if ["$1" == ""]
then
	echo -e "${BLUE}SIGMA SECURITY - PARSING HTML${END}"
	echo -e "Modo de uso: ${RED}./parsinghtml.sh${END}${YELLOW} exemplo.com.br${END}"
else
	echo -e "${GREEN}Resolvendo URLs em:${END}${BLUE} $1 ${END}"
	sleep 2
	echo -e "${RED}================================================================${END}"
	wget $1
	echo -e "${RED}================================================================${END}"
	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v '<l' > hostlist
	sleep 2
	clear
	echo -e "${GREEN}Hosts encontrados:${END}"
	sleep 1
	echo -e "${RED_BLINK}========================================${END}"
	for url in $(cat hostlist); do host $url;done
	echo -e "${RED_BLINK}========================================${END}"
	sleep 1
	rm hostlist
	rm index.html
fi	

