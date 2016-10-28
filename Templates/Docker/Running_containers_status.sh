#!/bin/sh
#set -x
CN=$1
CID=$(sudo docker inspect -f {{.Id}} $CN )
function cpuuser {
	cat /sys/fs/cgroup/cpu,cpuacct/system.slice/docker-${CID}.scope/cpuacct.stat | awk 'NR==1{print $2}'
}

function cpusystem {
	cat /sys/fs/cgroup/cpu,cpuacct/system.slice/docker-${CID}.scope/cpuacct.stat | awk 'NR==2{print $2}'
}

function cache {
	grep '^cache ' /sys/fs/cgroup/memory/system.slice/docker-${CID}.scope/memory.stat | awk '{print $2}'
}

function rss {
	grep '^rss ' /sys/fs/cgroup/memory/system.slice/docker-${CID}.scope/memory.stat | awk '{print $2}' 
}

function swap {
	grep '^swap ' /sys/fs/cgroup/memory/system.slice/docker-${CID}.scope/memory.stat | awk '{print $2}'
}

function status {
	value=$(sudo docker ps |awk -v var=${CID} '$NF==var {print $NF}')
	test $value && echo 1 || echo 0
}

function capacity {
	sudo docker exec ${CID} df -P | awk  '$1~/\/dev\/mapper/{print $3}'
}

function network_RX {
	PID=$( sudo docker inspect -f {{.State.Pid}} $CN )
	[ -d /var/run/netns ] || sudo mkdir -p /var/run/netns
	sudo ln -sf /proc/${PID}/ns/net /var/run/netns/$CID
	sudo ip netns exec $CID  netstat -ie|awk '/RX/{print $5}'|head -n 1
}

function network_TX {
	PID=$( sudo docker inspect -f {{.State.Pid}} $CN )
	[ -d /var/run/netns ] || sudo mkdir -p /var/run/netns
	sudo ln -sf /proc/${PID}/ns/net /var/run/netns/$CID
	sudo ip netns exec $CID  netstat -ie|awk '/TX/{print $5}'|head -n 1
}

$2 
