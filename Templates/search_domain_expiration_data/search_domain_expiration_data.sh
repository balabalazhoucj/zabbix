#!/bin/sh
domain=$1
login_cookie=$(curl -s http://api.chaxun.la/login/login/\?username\=lantop\&password\=e550e9540e0f3762d74d4c751ff0fe92\&ajax\=1 | jq .cookie|awk -F '"' '{print $2}')
exprie_date=$(curl -s http://api.chaxun.la/toolsAPI/getwhois/\?k\=$domain\&keywordsid\=$login_cookie |grep -oP "\d{4}-\d{2}-\d{2}"|sort -nr | head -n 1)
[ -z $exprie_date ] && exprie_date=$(curl -s http://api.chaxun.la/toolsAPI/getwhois/\?k\=$domain\&keywordsid\=$login_cookie |grep -oP "\d{2}-\w{3}-\d{4}"|sort -t - -k 3 -nr| head -n 1)
[ -z $exprie_date ] && exit 1 

now_date=$(date -I)
second=$(($(date +%s -d "$exprie_date")-$(date +%s -d "$now_date")))
day=$(($second/3600/24))
echo $day
