pragma solidity >=0.7.0 <=0.8.0;

// The contract represents our program.
contract NameThingsCities {
    // Definition of variables
    
    /*
    - We used struct variables for greater versatility.
    - The 'master' variable, if true, allows the player to choose the letter.
    - Within the structs, there are three string variables to store the game's answers.
    */
    struct Player {
        address payable playerAddress;
        bytes name; 
        bytes things; 
        bytes city;  
        uint256 errorCount;
        uint256 points;
        bool win;
        bool isMaster;
    }
    
    // Variable to identify the game letter
    bytes public gameLetter;
    
    // Struct Instances
    Player public mario;
    Player public luigi;
    
    // Constructor
    constructor() {
        mario.playerAddress = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        luigi.playerAddress = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    }
    
    // Function Definitions
    
    // Master selection
    function chooseMaster(bool isMaster) public {
        mario.isMaster = isMaster;
    }
    
    // Alternative master insertion
    // function chooseMaster(string memory x) public {
    //     if (x == "Mario") {
    //         mario.isMaster = true;
    //     } else if (x == "Luigi") {
    //         luigi.isMaster = true;
    //     } else {
    //         require(msg.sender == x.playerAddress, "User does not exist :(");
    //     }
    // }
    
    // Letter selection
    function selectLetter(string memory newLetter) public {
        gameLetter = bytes(newLetter);
    }
    
    modifier onlyByMaster(bool isMaster) {
        require(msg.sender != mario.playerAddress, "User is not the Master :(");
    }
    
    function compareBytes(bytes1 a, bytes1 b) internal pure returns (bool) { 
        return keccak256(abi.encode(a)) == keccak256(abi.encode(b)); 
    }
    
    // Insert name
    function insertName(string memory word1, string memory word2) public {
        mario.name = bytes(word1);
        luigi.name = bytes(word2);
        
        bytes memory buffer1 = bytes(word1);
        bytes memory buffer2 = bytes(word2);
        
        bool x = compareBytes(buffer1[0], gameLetter[0]);
        bool y = compareBytes(buffer2[0], gameLetter[0]);
        
        if (!x) {
            mario.errorCount++;
        }
        
        if (!y) {
            luigi.errorCount++;
        }
    }
    
    // Insert things
    function insertThings(string memory word1, string memory word2) public {
        mario.things = bytes(word1);
        luigi.things = bytes(word2);
        
        bytes memory buffer1 = bytes(word1);
        bytes memory buffer2 = bytes(word2);
        
        bool x = compareBytes(buffer1[0], gameLetter[0]);
        bool y = compareBytes(buffer2[0], gameLetter[0]);
        
        if (!x) {
            mario.errorCount++;
        }
        
        if (!y) {
            luigi.errorCount++;
        }
    }
    
    // Insert city
    function insertCity(string memory word1, string memory word2) public {
        mario.city = bytes(word1);
        luigi.city = bytes(word2);
        
        bytes memory buffer1 = bytes(word1);
        bytes memory buffer2 = bytes(word2);
        
        bool x = compareBytes(buffer1[0], gameLetter[0]);
        bool y = compareBytes(buffer2[0], gameLetter[0]);
        
        if (!x) {
            mario.errorCount++;
        }
        
        if (!y) {
            luigi.errorCount++;
        }
    }
    
    // Check winner
    function determineWinner() public {
        if (mario.errorCount < luigi.errorCount) {
            mario.win = true;
        } else {
            luigi.win = true; 
        }
    }
    
    // Decrease Ethereum
    function decreaseEthereum() payable public {
        if (!mario.win) {
            luigi.playerAddress.transfer(msg.value);
        } else if (!luigi.win) {
            mario.playerAddress.transfer(msg.value);
        }
    }
    
    // Add points
    function addPoints() public {
        if (mario.win) {
            mario.points++;
        } else if (luigi.win) {
            luigi.points++;
        }
    }
}
