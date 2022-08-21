/* hardhat.config.js */
require("@nomiclabs/hardhat-waffle")
const fs = require("fs")
const privateKey = fs.readFileSync(".secret").toString()
const projectId = ""
module.exports = {
	defaultNetwork: "hardhat",
	networks: {
		hardhat: {
			chainId: 1337
		},
	  mumbai: {
	    url: "https://rpc-mumbai.maticvigil.com",
	    accounts: [process.env.privateKey]
	  }
	},
	solidity: {
		version: "0.8.4",
		settings: {
			optimizer: {
				enabled: true,
				runs: 200
			}
		}
	}
}