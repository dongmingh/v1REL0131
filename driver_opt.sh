#!/bin/bash

#OS

OSName=`uname`
echo "Operating System: $OSName"
#sanity check input args
Req=$1
if [ $Req != "create" ]; then
     echo "error: invalid input parameter: $Req"
     echo ""
     echo "Usage: ./driver_opt.sh create [network option]"
     echo "      network option:"
     echo "             1: create a network with 1 orderer (solo), 1 peer"
     echo "             2: create a network with 1 orderer (kafka), 1 peer"
     echo "             3: create a network with 1 cop, 1 orderer (kafka), 1 peer"
     echo "      ex. ./driver_opt.sh 2: create the option 2 network"
     echo ""
     exit

fi
nOpt=$2

case $nOpt in
   1)
     echo "Create network option 1: 1 orderer (solo), 1 peer"
     nBroker=0
     ;;

   2)
     echo "Create network option 1: 1 orderer (solo), 1 peer"
     nBroker=1
     ;;
   3)
     echo "Create network option 1: 1 orderer (solo), 1 peer"
     nBroker=1
     ;;

   *)
     echo ""
     echo "Usage: ./driver_opt.sh create [network option]"
     echo "      network option:"
     echo "             1: create a network with 1 orderer (solo), 1 peer"
     echo "             2: create a network with 1 orderer (kafka), 1 peer"
     echo "             3: create a network with 1 cop, 1 orderer (kafka), 1 peer"
     echo "      ex. ./driver_opt.sh 2: create the option 2 network"
     echo ""
     exit

esac

VP=`docker ps -a | grep 'peer node start' | wc -l`
echo "existing peers: $VP"


echo "remove old docker-composer.yml"
rm -f docker-compose.yml

echo "docker pull https://hub.docker.com/r/rameshthoomu/fabric-ccenv-x86_64"
docker pull rameshthoomu/fabric-ccenv-x86_64

# form json input file
jsonFILE="network_opt"$nOpt".json"
echo "jsonFILE $jsonFILE"

N=1
# create yml
node json2yml.js $jsonFILE $N $nBroker

# create network
       docker-compose -f docker-compose.yml up -d --force-recreate $VPN 

exit
