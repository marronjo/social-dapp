<script>
  import Wallet from '$lib/Wallet.svelte';
  import CreatePost from '$lib/CreatePost.svelte';
  import Posts from '$lib/Posts.svelte';

  const contractAddress = "0x3585004F86af7b95B8aD63a898C90279B101b678";
</script>

<main>
  <h1>Welcome to Social Dapp</h1>
  <p>Visit <a href="https://github.com/marronjo/social-dapp">github</a> to check out the repo</p>
  <div>
    <Wallet />
    <CreatePost {contractAddress}/>
    <Posts {contractAddress}/>
  </div>
</main>