

Starting the node:
	1. Comment the second line of startTestNet.sh (by default it is commented here anyway)
	2. cd to this directory root and run ./startTestNet.sh in console (cut and paste the commented accounts inside "alloc" to somewhere. having it there throws error at this point).
		2.1 Make sure the data directory path in startTestNet.sh and the data folder (devChain) are same
	3. If the genesis block is created successfully, it will say " successfully wrote genesis block" 
		3.1 Now comment Line 1 and uncomment Line 2 in startTestNet.sh
		3.2 Run: ./startTestNet.sh
		3.3 In another terminal, attach to the running geth process using IPC Interprocess communication):
		3.4 Run:
			sudo geth attach ipc://<absolute path to devChain folder>/devChain/geth.ipc
		3.5 Once you are in the geth console, use web3 to create some accounts using : 
			
			web3.personal.newAccount()

			copy the account number and password in safe place. You will need to unlock the account using the password everytime you want to make a transaction.
	4. Now copy all these accounts to the itmo-genesis.json file. The format in which accounts are to be placed is commented. Uncomment and replace the accounts. The balances are all in Wei (1 ETHER = 10^18 Wei)

	5. Stop the running node. Comment line 2 and uncomment Line 1 and run ./startTestNet.sh. Now the new accounts are initialized with the balance
	6. Comment line 1 in startTestNet.sh. Uncomment line 2
	7. run ./startTestNet.sh , the output should be similar like step 3
	8. Repeat steps 3.1 and 3.2 . (OPtional: Repeat step 3.4 and run: web3.personal . It will show the new accounts)
	9. Now your private node is running. You can make RPC to this node using the ipaddress of this server and the port number defined in startTestNet.sh file. (If your node is inside a LAN then RPC could not be possible. Router should have port forwarding enabled to do so)

	10. Note that mining is not started yet. If you create some transactions, then they will stay in pending status. (Run web3 in geth console to see them) To start mining you have to run: web3.miner.start(<no of threads you want to run>) or you can add "--mine" (without quotes) in the second line of startTestNet.sh . For this, the coin_base and default accounts are to be set. The default account is normally the first account that is created. You can check all those via the geth console by running: web3 . The default account is the one where all the mining rewards are send.

	Setup to run private node as a start-up process:

	1. startTestNet.sh should be executable
	2. Best way to run the node is to run it as a startup process (at least that's how I am doing it)
	3. add the full executable path of startTestNet.sh in /etc/rc.local
		3.1 startTestNet.sh should be owned by root to be executable during start-up
