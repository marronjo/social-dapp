<h1>Welcome to Social Dapp</h1>
<p>Visit <a href="https://github.com/marronjo/social-dapp">github</a> to check out the repo</p>

<script lang="ts">
  import type { Provider } from 'ethers';
  let account: Provider;
  let walletError: string;
  let walletConnected = false;
  async function connectWallet() {
    walletConnected = false;
    const { ethereum }: any = window;
    await ethereum
      .request({ method: 'eth_requestAccounts' })
      .then((accountList : Provider[]) => {
        const [firstAccount] = accountList;
        account = firstAccount;
        walletConnected = true;
        console.log(`account connected : ${account}`);
      })
      .catch((error: any) => {
        walletConnected = false;
        walletError = error;
        console.log(`error connecting wallet : ${error}`);
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