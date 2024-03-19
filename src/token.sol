// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract token is ERC20 {
    constructor() ERC20("Token", "token"){
        _mint(msg.sender, 10000000000 * (10 ** decimals()));
    }
}