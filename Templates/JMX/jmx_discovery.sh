#!/bin/sh
	printf '{    \n'
	printf '    "data":['
	port=($(sudo  awk -vFS='\n' -vORS=' ' '$1=$1' /etc/zabbix/jmx_port ))
	for ((i=0;i<${#port[@]};i++))
	do
		printf '\n\t{'
		printf "\n\t\t\"{#JMX_PORT}\":\"${port[i]}\""
		[ $i == $((${#port[@]}-1)) ] && break
		printf "\n\t},"
	done
	printf '\n\t}\n    ]\n'
	printf '}\n'
