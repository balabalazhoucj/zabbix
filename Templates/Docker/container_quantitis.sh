#!/bin/sh
function running {
	sudo docker ps -q | wc -l
}

function all {
	sudo docker ps -qa | wc -l
}

function images {
	sudo docker images -q | wc -l
}

$1
