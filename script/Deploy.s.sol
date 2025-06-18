// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MockTokenWithPermit} from "../src/MockTokenWithPermit.sol";
import {console} from "forge-std/console.sol";

contract DeployMockTokenWithPermit is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("WALLET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        
        MockTokenWithPermit token = new MockTokenWithPermit();
        
        vm.stopBroadcast();
        
        console.log("MockTokenWithPermit deployed at:", address(token));
        console.log("Name:", token.name());
        console.log("Symbol:", token.symbol());
        console.log("Decimals:", token.decimals());
        console.log("Total Supply:", token.totalSupply());
        console.log("Deployer Balance:", token.balanceOf(msg.sender));
        console.log("Domain Separator:", vm.toString(token.DOMAIN_SEPARATOR()));
    }
}