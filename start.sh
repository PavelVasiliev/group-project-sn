#!/bin/sh

# ---------------------------------------------------------------------
# Group15 Diploma startup script. 
# TO START: ./social.sh name_of_network (network_name) email_pass api_secret
# ---------------------------------------------------------------------

network_name=${1:-social_network}
email_pass=${2}
api_secret=${3}

#Creating bridge
docker network create --driver bridge $network_name

#EUREKA
docker run -d --name discovery-eureka -p 8888:8888 typuctroot/discovery

#DATABASE
docker run -d --name database --network $network_name -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres postgres

#FRONT
docker run -d --name front --network $network_name -p 8080:8080 kholmden/frontend

#GATEWAY
docker run -d --name gateway --network $network_name -p 8086:8086 typuctroot/gateway

#SERVER #1
docker run -d --name server-sn1 --network $network_name -p 8081:8081 -e DROP_TABLES=true -e MAIL_USER=soc.net.group15@gmail.com -e MAIL_PASS=$email_pass -e CLOUD_NAME=dpwfgek2k -e API_KEY=958318285579326 -e API_SECRET=$api_secret typuctroot/sn

#SERVER #2
docker run -d --name server-sn1 --network $network_name -p 8082:8081 -e DROP_TABLES=false -e MAIL_USER=soc.net.group15@gmail.com -e MAIL_PASS=$email_pass -e CLOUD_NAME=dpwfgek2k -e API_KEY=958318285579326 -e API_SECRET=$api_secret typuctroot/sn

#NETWORK INFO
docker inspect $network_name
