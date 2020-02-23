
# install
    peer chaincode install -p /opt/gopath/src/github.com/chaincode/mycodesgetdata -n mycode -l node -v 1


# instantiate

peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycodesgetdata -l node -c '{"Args":[]}' -v 1


# Invoke
peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycode -c '{"Args":["saveData","101","quizoxis"]}'
