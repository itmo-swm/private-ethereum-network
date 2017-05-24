#!/bin/bash

sudo /usr/bin/geth  --datadir="<absolute path to devChain>" init genesis.json
#sudo /usr/bin/geth --identity "TestMainNode" --datadir "<absolute path to devChain>" --rpc --rpcport "5678" --rpcaddr "0.0.0.0" --rpccorsdomain "*" --port "30303" --nodiscover --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "db,eth,net,web3,personal" --autodag --networkid 1900 --nat "any"
