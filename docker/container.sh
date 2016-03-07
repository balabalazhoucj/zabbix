#!/bin/sh
#$1 is 'status|capacity'
#$2 is container id or name 

status() {
	value=$(sudo docker ps |awk -v var=$1 '$NF==var {print $NF}')
	test $value && echo 1 || echo 0
}

capacity() {
	sudo docker exec $1 df -P | awk  '$1~/\/dev\/mapper/{print $3}'
}

[ $# = '2' ] && $1 $2 || echo '[ERROR] must have two parameters';exit 123
