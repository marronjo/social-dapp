<script>
  import 'dotenv';

  import Wallet from '$lib/Wallet.svelte';
  import CreatePost from '$lib/CreatePost.svelte';

  const contractAddress = "0x3585004F86af7b95B8aD63a898C90279B101b678";
</script>

<nav>
  <a href="/posts">Posts</a>
</nav>

<main>
  <h1>Welcome to Social Dapp</h1>
  <p>Visit <a href="https://github.com/marronjo/social-dapp">github</a> to check out the repo</p>
  <div>
    <Wallet />
    <CreatePost {contractAddress}/>
    <!-- <Posts {contractAddress}/> -->
  </div>
</main>