// 0.5.1-c8a2
// Enable optimization
pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./ERC20Detailed.sol";

contract Token is ERC20, ERC20Detailed {

    constructor () public ERC20Detailed("10Bit", "10Bit", 18) {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
© 2021 GitHub, Inc.
