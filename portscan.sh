#!/bin/bash
for x in 13 37 30000 3000 1337
do
	hping3 -S -p $x -c 1 37.59.174.235

done
