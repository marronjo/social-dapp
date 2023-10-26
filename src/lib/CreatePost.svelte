<script>
    import { ethers } from 'ethers';
    //import { Social } from '../../out/Social.sol/Social.json'
    import Social from '../abi/Social.json';

    const CONTRACT_ADDRESS = "0x3585004F86af7b95B8aD63a898C90279B101b678";

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
            CONTRACT_ADDRESS,
            Social.abi,
            signer
        );

        latestPostId = await socialContract.CreatePost(postContent);
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