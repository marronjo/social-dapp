<script>
    import { ethers } from 'ethers';
    //import { Social } from '../../out/Social.sol/Social.json'
    import Social from '../abi/Social.json';

    const contractAddress = "0x3585004F86af7b95B8aD63a898C90279B101b678";

    let posts = [];

    async function getAllPosts(){
        if (!window.ethereum) {
            return;
        }
    
        const provider = new ethers.providers.Web3Provider(window.ethereum);

        const socialContract = new ethers.Contract(
            contractAddress,
            Social.abi,
            provider
        );

        posts = await socialContract.getAllPosts();
    }
</script>
<div>
    <button on:click={getAllPosts}>refresh</button>
    <ul>
        {#each posts as post}
        <p>{post.id}</p>
        <p>{post.author}</p>
        <p>{post.content}</p>
        {/each}
    </ul>
</div>