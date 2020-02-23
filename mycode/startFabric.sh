#!/bin/bash
#
# Exit on first error
set -e

FABRIC_SAMPLES_PATH="../../fabric-samples"
GBC_DOCKER_COMPOSE_FILE="gbc-docker-compose-cli.yaml"

echo ""
echo "***************************************************************"
echo "* GBC-Fabric-Samples: Starting                                *"
echo "* ----------------------------------------------------------- *"
echo "* Starting: Calling fabric-samples/first-network              *"
echo "*                                                             *"
echo "***************************************************************"
echo ""
cp -f ../docker/$GBC_DOCKER_COMPOSE_FILE $FABRIC_SAMPLES_PATH/first-network/$GBC_DOCKER_COMPOSE_FILE
cd $FABRIC_SAMPLES_PATH/first-network

echo ""
echo "--> Calling: BYFN down -------------------------------------- *"
echo y | ./byfn.sh down

echo ""
echo "--> Calling: BYFN UP ---------------------------------------- *"
echo "     with docker-compose-file:                                *"
echo "     $GBC_DOCKER_COMPOSE_FILE "
echo ""
echo y | ./byfn.sh up -a -d 10 -t 90 -s couchdb -l node -f ./$GBC_DOCKER_COMPOSE_FILE

echo ""
echo "--> List of active containers ------------------------------- *"
echo ""
docker ps --format="{{.ID}}\t{{.Names}}"

set +x
echo ""
echo "***************************************************************"
echo "* GBC-Fabric-Samples: Start completed                         *"
echo "***************************************************************"
echo ""
