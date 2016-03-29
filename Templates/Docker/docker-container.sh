#!/bin/sh
	printf '{\n'
	printf '\t"data":['
	container=($(sudo docker ps | awk  'NR!=1{print $NF}'))
	for ((i=0;i<${#container[@]};i++))
	do
		printf '\n\t{\n'
		printf "\t\t\"{#CONTAINER_NAME}\":\"${container[i]}\""
		#capacity=$(sudo docker exec ${container[i]} df  -P | awk  '$1~/dev/mapper{print $3}')
		#printf "\"{#capacity}\":\"${capacity}\""
		[ $i == $((${#container[@]}-1)) ] && break
		printf "\n\t},"
	done
	printf '\n\t}\n\t]\n'
	printf '}\n'
