#!/bin/sh

# ---------------------------------------------------------------------
# Group15 Diploma backend restart script. 
# TO START: ./serv-restart.sh name_of_network if_drop_tables?
# ---------------------------------------------------------------------
docker stop server-sn1 server-sn2
docker rm server-sn1 server-sn2
docker pull typuctroot/sn

network_name=${1:-social_network}
drop=${2:-false}
email_pass=${3}
api_secret=${4}

#SERVER #1
docker run -d --name server-sn1 -p 8081:8081 --network $network_name -e DROP_TABLES=$drop -e MAIL_USER=soc.net.group15@gmail.com -e MAIL_PASS=$email_pass -e CLOUD_NAME=dpwfgek2k -e API_KEY=958318285579326 -e API_SECRET=$api_secret typuctroot/sn

#SERVER #2
docker run -d --name server-sn2 -p 8082:8081 --network $network_name -e DROP_TABLES=false -e MAIL_USER=soc.net.group15@gmail.com -e MAIL_PASS=$email_pass -e CLOUD_NAME=dpwfgek2k -e API_KEY=958318285579326 -e API_SECRET=$api_secret typuctroot/sn
