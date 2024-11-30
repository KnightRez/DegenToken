# DegenToken in Avalanche using Remix
This smart contract was deployed to Fuji (C-Chain) using [Remix](https://remix.ethereum.org/) and the transactions can be viewed at [snowtrace](https://testnet.snowtrace.io/address/0xE2f942988C05e67f8CfE69b8885b6C1E6Bc415DA).

The [repo](https://github.com/Metacrafters/DegenToken/tree/main) by MetaCrafters was used as a reference that uses hardhat to deploy a contract.
There is an in depth guide in MetaCrafter's repo about the project in the `GUIDE.md` file.

## MetaMask Setup
1. MetaMask Wallet
  - Create at least 2 MetaMask wallet accounts (the other wallet is for testing the transfering of tokens).
2. Fuji Network
  - Get Testnet AVAX from the [faucet](https://test.core.app/tools/testnet-faucet/?subnet=c&token=c) using your MetaMask wallet address.
  
  ![image](https://github.com/user-attachments/assets/9d370ff3-a6a6-4a24-b979-559b2a3afcff)

  - Click `Add Avalanche L1 to Wallet` to automatically add the Fuji network to the MetaMask wallet extension
  - A free coupon can be acquired [here](https://guild.xyz/avalanche/developers) by joining their discord server to get a member role, and verifying an email.
> [!NOTE]
> These tokens have no real value.

## Deploying to Fuji using Remix
1. Deploy to Fuji using remix
   - Clone repo to [Remix](https://remix.ethereum.org/).
   - Open the `DegenToken.sol` file, and compile the contract.
   - When deploying, select `Injected Provider - MetaMask` as the environment, your MetaMask wallet accounts should display in the account selection.
   - Beside the Deploy button, enter the address of the MetaMask wallet account that contains the Testnet AVAX as the `initialOwner`, and click deploy to deploy the contract to Fuji.

   ![image](https://github.com/user-attachments/assets/ae8f63b6-50f1-431a-82fc-cefec19bb573)
    
2. Check Deployed Contract in Snowtrace
   - Search for the contract in [snowtrace testnet](https://testnet.snowtrace.io/) using the contract address that is given after deploying.
   ![image](https://github.com/user-attachments/assets/f98f856b-ea3d-4c9b-b442-410d78520f26)

## Relevant Functions
> [!NOTE]
> The buttons that are not colored blue requires AVAX for the transaction to work

`burn` - burns an amount of tokens of the currently selected account

`mint` - mints tokens to an account (the selected account has to be the owner for the function to work)

`redeemTokens` - pay for items using tokens by selecting the number of the corresponding item

|Item Number| Item | Cost |
|-|-|-|
|1|Leather Helm|200 DGN|
|2|Sword|500 DGN|
|3|Shield|250 DGN|
|4|Dagger|100 DGN|
|5|Recall Spell|300 DGN|

`transferTokens` - transfers tokens to an account from the currently selected account

> [!NOTE]
> The following buttons does not require AVAX

`balanceOf` - checks the balance of an account.

`checkBalance` - checks the balance of the currently selected account.

`decimals` - returns the decimal used for the contract (0 is used for simple computations, the default is 18).

`name` - returns the name of the token (Degen).

`showItems` - returns a string of the available items in the contract.

`symbol` - returns the symbol of the token (DGN).

`totalSupply` - returns the total amount of tokens in the contract.
