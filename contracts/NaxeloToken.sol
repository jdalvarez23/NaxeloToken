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

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

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

    // Delegated Transfer
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // update the allowance to approve an account
        allowance[msg.sender][_spender] = _value;

        // trigger the approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
    
    // Transfer From
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        // change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // update the allowance
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

}