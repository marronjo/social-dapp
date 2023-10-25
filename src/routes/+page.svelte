<script>
  import Wallet from '$lib/Wallet.svelte';
  import CreatePost from '$lib/CreatePost.svelte';
</script>

<main>
  <h1>Welcome to Social Dapp</h1>
  <p>Visit <a href="https://github.com/marronjo/social-dapp">github</a> to check out the repo</p>
  <div>
    <Wallet />
    <CreatePost />
  </div>
</main>