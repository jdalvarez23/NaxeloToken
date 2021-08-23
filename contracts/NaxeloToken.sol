pragma solidity >=0.4.22 <0.9.0;

contract NaxeloToken {
    uint256 public totalSupply;
    string public name = "Naxelo Token";
    string public symbol = "NXLO";
    string public standard = "Naxelo Token v1.0";

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) public {
        // allocate the initial supply
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    // Transfer
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // read balance of sender
        require(balanceOf[msg.sender] >= _value);
        // transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // trigger a transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }
    
}