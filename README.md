# Speedy-Words-Solidity-Smart-Contract
This Solidity contract, Speedy Words, demonstrates a simple game-like structure where players input names, objects, and cities based on a specified letter. This contract is built on the Ethereum blockchain using Solidity version 0.8.0.

Overview
The contract facilitates a game between two players, "Mario" and "Luigi," allowing them to input names, objects, and cities that begin with a chosen letter. The game mechanics include error tracking, winner determination, and reward distribution.

# Features
Player Structs: Structs are used to manage player data, including addresses, inputs, error counts, points, and game status.
Master Selection: Functionality to designate a "master" player who can choose the game letter.
Input Functions: Separate functions for players to input names, objects, and cities.
Comparison Functions: Utilizes functions to compare inputs with the chosen letter.
Winner Determination: Logic to determine the player with fewer errors as the winner.
Ethereum Handling: Mechanism to transfer rewards based on game outcomes.
# Setup
Deploy Contract: Deploy this contract on the Ethereum blockchain.
Initialize Players: Assign player addresses (in the constructor) for "Mario" and "Luigi."
# Gameplay
Master Selection: Call the chooseMaster function to designate the "master" player.
Letter Selection: Use selectLetter to specify the game letter.
Input Data: Utilize insertName, insertThings, and insertCity functions to input data.
Winner Determination: Trigger determineWinner to identify the player with fewer errors.
Reward Distribution: Execute decreaseEthereum to distribute rewards based on game results.
# Contract Structure
Player Struct: Contains address, input fields, error count, points, and game status.
Modifiers: Includes a modifier to restrict functions only to non-master players.
Comparison Function: Compares inputs with the chosen letter for error tracking.
Deployment
Deploy this contract on an Ethereum-compatible network using Solidity version 0.8.0.

