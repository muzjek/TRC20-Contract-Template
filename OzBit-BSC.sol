/**
 *Submitted for verification at BscScan.com on ...-...-...
*/

// SPDX-License-Identifier: UNLISCENSED


===============================================================================
===============================================================================

           IIIIIIII                  IIIIIIIIII
         II        II                II        II
        II          II               II         II     II       II
        II          II               II         II              II
        II          II  IIIIIIIIIII  IIIIIIIIIIII      II    IIIIIIII
        II          II           II  II          II    II       II
        II          II         II    II           II   II       II
        II          II      II       II           II   II       II
        II          II    II         II           II   II       II
         II        II   II           II          II    II        II
           IIIIIIII     IIIIIIIIIII  IIIIIIIIIIIII     II          IIIIIII

================================================================================
================================================================================


// OzBit project is a DEFI program to be used as a decentralized
   repository of assets and loans in the form of investments in OzBit Tokens
   which are given full rights to Token owners

// twitter
 
// telegram

pragma solidity 0.8.6;



 
contract    OzBit {
    string public name = "OzBit";
    string public symbol = "Ozb";
    uint256 public totalSupply = 1000000; 
    uint8 public decimals = 18;
    
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

     /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

     /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
  

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
