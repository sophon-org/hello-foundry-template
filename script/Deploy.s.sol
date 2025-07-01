// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MockTokenWithPermit} from "../src/MockTokenWithPermit.sol";

contract DeployMockTokenWithPermit is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("WALLET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address paymaster = address(0x98546B226dbbA8230cf620635a1e4ab01F6A99B2);
        bytes memory paymaster_encoded_input = 
            abi.encodeWithSelector(bytes4(keccak256("general(bytes)")),bytes("0x"));
        (bool success,) = address(vm).call(
            abi.encodeWithSignature(
                "zkUsePaymaster(address,bytes)",
                paymaster,
                paymaster_encoded_input
            )
        );
        MockTokenWithPermit token = new MockTokenWithPermit();
        
        vm.stopBroadcast();
    }
}