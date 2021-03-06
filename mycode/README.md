# Test Matrix

| Platform | HLF 1.4.0 | HLF 2.0.0 |
| --- | :-: | :-: |
| ubuntu 16.04 | :question: | :question: |
| ubuntu 18.04 | :white_check_mark: | :question: |

---

# Docker Compose File:
gbc-fabric-samples/docker contains a modified docker compose file. The modification attaches an additional volume to map *gbc-fabric-samples/chaincode* to */opt/gopath/src/gbc-fabric-samples/chaincode* directories.

```
./../../gbc-fabric-samples/chaincode/:/opt/gopath/src/gbc-fabric-samples/chaincode
```

# Enable Dev mode
To enable dev more you need to modify the peer-base.yaml file under fabric-samples/first-network directory.

```
command: peer node start --peer-chaincodedev=true
```

![Alt text](images/enable_devmode_base_peer_base_yaml.png?raw=true "Install Chaincode")

# Start Fabric

The following script uses fabric-samples/first-network/byfn.sh script. This script calls the byfn.sh as follows:

```
./byfn.sh up -a -d 10 -t 90 -s couchdb -l node -f gbc-docker-compose-cli.yaml
```

```shell
cd ~/gbc-fabric-samples/mycode
./startFabric.sh
```

# Client/SDK Setup
```shell
cd ~/gbc-fabric-samples/mycode/javascript
npm install
```

# Enroll Admin

```shell
cd ~/gbc-fabric-samples/mycode/javascript
node enrollAdmin.js
```

# Register User

```shell
cd ~/gbc-fabric-samples/mycode/javascript
node registerUser.js
```

# Open CLI Terminal
```
docker exec -it cli bash
```

# Install

```shell
peer chaincode install -p /opt/gopath/src/gbc-fabric-samples/chaincode/mycode -n mycode -l node -v 1
```

![Alt text](images/mycode_install_cli.png?raw=true "Install Chaincode")

# Instantiate
```shell
peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycode -l node -c '{"Args":[]}' -v 1
```

![Alt text](images/mycode_instantiate_peer0.org1.example.com.png?raw=true "Instantiate - peer0.org1.example.com")

![Alt text](images/mycode_instantiate_cli_output.png?raw=true "Instantiate - CLI Command Output")


# Invoke - saveData
```shell
peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycode -c '{"Args":["saveData","101","hlf14"]}'
```

![Alt text](images/mycode_Invoke_saveData_peernode.png?raw=true "Invoke - saveData - peer0.org1.example.com")

![Alt text](images/mycode_Invoke_saveData_cli.png?raw=true "Invoke - saveData - CLI")

# Invoke - getData
```shell
peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycode -c '{"Args":["getData","101"]}'
```

![Alt text](images/mycode_Invoke_getData_peernode.png?raw=true "Invoke - getData - peer0.org1.example.com")

![Alt text](images/mycode_Invoke_getData_cli.png?raw=true "Invoke - getData - CLI")
