#!/bin/bash

if ["$1" == ""]
then
	echo "PORTSCAN NETWORK"
	echo "Modo de uso: $0 rede"
	echo "Exemplo: $0 172.16.1"
else
	for ip in {1..254};
	do hping3 -S -p 80 -c 1 $1.$ip 2> /dev/null | grep "flags=SA";
done
fi
