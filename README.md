# Project Title

1. clone this repo by a command:
   git clone https://github.com/M-Abdullah-Bhatti/FashionChain-Contract

2. install all the packages:
   npm i

3. run the hardhat node:
   npx hardhat node

4. Deploy the contract:
   -To deploy on hardhat local node run this command on terminal: npx hardhat run .\scripts\deploy.js

-To deploy on sepolia testnet:
First, amke the .env file on node with the variable:
PRIVATE_KEY = paste_your_private_key here
SEPOLIA_RPC_URL = paste_your_sepolia_rpc_url
ETHERSCAN_API_KEY=paste_your_etherscan_api_key
Then run this command:
npx hardhat run .\scripts\deploy.js --network sepolia

after this verify your contract by a script:
npx hardhat run .\utils\verify.js --network sepolia
