import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();
require("@nomiclabs/hardhat-ethers");

const { API_URL, PRIVATE_KEY } = process.env;

const config: HardhatUserConfig = {
    solidity: "0.6.12",
};

module.exports = {
    solidity: "0.6.12",
    defaultNetwork: "matic",
    networks: {
        hardhat: {
            // gas: 100000000000,
            // gasPrice: 100000000000,
            // blockGasLimit: 100000000000,
        },
        matic: {
            url: API_URL,
            accounts: [`0x${PRIVATE_KEY}`],
            // gas: 100000000000,
            // gasPrice: 100000000000,
        },
    },
};

export default config;
