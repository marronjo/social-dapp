<script>
    import { ethers } from 'ethers';
    import Social from '../out/Social.sol/Social.json';

    export let contractAddress;

    let latestPostId = 0;
    let loading = false;
    let postContent = '';

    async function createPost(postContent){
        if (!window.ethereum) {
            return;
        }
        loading = true;
    
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();

        const socialContract = new ethers.Contract(
            contractAddress,
            Social.abi,
            signer
        );

        latestPostId = await socialContract.createPost(postContent);
        postContent = '';
        loading = false;
    }
</script>

<div>
    <label for="message">Write post content below</label>
    <textarea
      disabled={loading}
      id="message"
      class="textBox"
      value={postContent}
      on:change={(e) => (postContent = e.target.value)}
    />
    <button disabled={loading} on:click={() => createPost(postContent)}>
        Create Post
    </button>
</div>