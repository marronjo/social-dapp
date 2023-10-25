<h1>Welcome to Social Dapp</h1>
<p>Visit <a href="https://github.com/marronjo/social-dapp">github</a> to check out the repo</p>

<script>
  import { ethers } from 'ethers';
  let account;
  let walletError;
  let walletConnected = false;
  async function connectWallet() {
    walletConnected = false;
    const { ethereum } = window;
    await ethereum
      .request({ method: 'eth_requestAccounts' })
      .then((accountList) => {
        const [firstAccount] = accountList;
        account = firstAccount;
        walletConnected = true;
        console.log('wallet connected');
        console.log(account);
      })
      .catch((error) => {
        walletConnected = false;
        walletError = error;
        console.log('error connecting wallet');
      });
  }
</script>

<div>
  {#if walletConnected}
    <div>
      <span/>
      Connected Account: {account}
    </div>
  {:else if !walletConnected && walletError != null}
    <div>
      <span>Error connecting wallet : {walletError}</span>
    </div>
  {:else} 
    <button on:click={connectWallet}>
      Connect MetaMask
    </button>
  {/if}
</div>