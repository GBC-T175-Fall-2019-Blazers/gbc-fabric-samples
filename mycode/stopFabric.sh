#!/bin/bash
#
#
set -e

FABRIC_SAMPLES_PATH="../../fabric-samples"

echo ""
echo "***************************************************************"
echo "* GBC-Fabric-Samples:  Stopping...                            *"
echo "***************************************************************"
cd $FABRIC_SAMPLES_PATH/first-network

echo ""
echo "--> Calling: BYFN down -------------------------------------- *"
echo y | ./byfn.sh down

echo ""
echo "--> List of active nodes ------------------------------------ *"
echo ""
docker ps --format="{{.ID}}\t{{.Names}}"

set +x
echo ""
echo "***************************************************************"
echo "* GBC-Fabric-Samples: Stop completed                          *"
echo "***************************************************************"
echo ""
