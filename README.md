<meta name="google-site-verification" content="E7ki6XY26kFYs5KAuzG9WcIqN8CobP_ANAYMhqeyAe0" />
## Blockchain-Powered-Procurement-System
### This project was built as a solution to problem statement in SIH2020 - Smart India Hackathon 2020
## Problem Statement BK225
GAIL procures most of the raw materials, items, office supplies and services through public procurement portal based on tendering system. We need to develop a Blockchain secured system to control this procurement process. 
As an example, 
Developer shall implement end-to-end process for Steel-pipes, that contains steps like 
A)procurement from Indian/Overseas vendor B)Shipping C) Transportation in intermediary points D) acceptance at GAIL store E) Payment to Vendor using smart contracts 
The implementation should use Open source technologies like Ethereum or equivalent and be able to show simple and good UI + clear documentation with out of the box thinking

## Demo/Explanatory Video: [Click me](https://www.youtube.com/watch?v=1Y5eyY-KKVw) 
## Deployment
To make it completely decentralized we have hosted the frontend on IPFS.
But as IPFS is in its initial stages, the link takes too long to respond.
So we also hosted it on central server "000webhostapp"<br />
To see the App in action <br />
[For Procurement](https://sihvisionhome.000webhostapp.com) <br />
[For Supplychain](https://sihteamvision.000webhostapp.com/) <br />
## Instructions for Developer
* Understanding
  * Go through [Demo](https://www.youtube.com/watch?v=1Y5eyY-KKVw), understand what we have built 
  * Read [documention](https://github.com/abhishekvispute/Blockchain-Powered-Procurement-System/blob/master/Documentation.pdf)
* Running this repo on your local server
  * We have divided the functionalities in two different folders, i.e. Procurement and Supply chain<br />
    *(Note : Procurement is only about how company publishes tender, vendors make bid and company allots that tender while supply chain is about  how item moves)* 
  * To run any of the folder, you have to start HTTP server<br />
  there are many ways to do this, but we used python for that
  * Example :
  Suppose you are in our repo, and you have to start Procurement server<br />
  cd Procurement<br />
  python -m SimpleHTTPServer 1337<br />
  Visit localhost:1337 on your browser
  * Remember you need MetaMask installed on your browser<br />
  Metamask doesn't connect with the site till you not allow it.<br />
  For this go to Settings > Connections > Addsite (localhost) > connect <br />
  ### Smart Contracts
  * The smart contracts are deployed on ropsten test network
  * To access the App's functionalities you will need coins. Get free coins from [faucet](https://faucet.ropsten.be/)
  * If you want to see smart contracts for reference, I have added folder of smart contracts in repo, but it doesnt have any connection with project. I deployed smart contart using remix on test network and called it by address using web3.js.
 ### Advice If you are building your own dApp
 *  For any developer, remembering syntax is cumbersome Use Skelton solidity code snippets of various concepts [Click me](https://github.com/abhishekvispute/SolidityCodeSnippets)
 * Use truffle as a framework if possible, it makes development/testing/deployment easy
 * Ethereum takes time, for tx to get finalized even for test network (pow consensus). Use different blockchain as backend if possible.
 See Quorum or  hyperledger fabric.
 * If you are intrested in deployement of app on IPFS, [See this](https://medium.com/ethereum-developers/the-ultimate-end-to-end-tutorial-to-create-and-deploy-a-fully-descentralized-dapp-in-ethereum-18f0cf6d7e0e)

 ### If you have any queries: Mail me [abhivispute33@gmail.com]
