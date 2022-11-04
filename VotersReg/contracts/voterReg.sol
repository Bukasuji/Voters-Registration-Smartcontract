// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


 //VotersRegister contract is a contract to register voters including their personal details (name, age and contact address)


contract VotersRegister{

    address public owner;
  
    mapping (address=>voter)voters;
    
    //assigning the contract deployer as the owner
    constructor()  {
      owner = msg.sender;
    }
    
    //a modifier onlyOwner is created to limit the access to function register to contract deployer
     
    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }
    
    struct voter{
        
        address voterId;
        string  name;
        string contactAddress;
        uint256 age;
        bool isExist;
        
    }
    
    // a function to register voterid(etherium address),name(voters name),contactAddress(home address) and age(voters age)
     
    function register(address voterId,string memory name,string memory contactAddress,uint256 age) public onlyOwner {
            
            //a require statment to disable multiple entry
            
            require(voters[voterId].isExist==false,"Multiple entry not allowed");
            
            
            //assigning the voter details to a key (voterId)
             
            voters[voterId]=voter(voterId,name,contactAddress,age,true);
    }
    
    
    // a function to get the details of a voter when voterId is given
     
            
    function getvoterDetails(address voterId) public view returns (address,string memory,string memory,uint256){
        
        // returning voterId,name,contactAdress, and age
         return(voters[voterId].voterId,voters[voterId].name,voters[voterId].contactAddress,voters[voterId].age);
    }
}