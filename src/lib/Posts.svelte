<script>
    import { ethers } from 'ethers';
    import Social from '../abi/Social.json';

    export let contractAddress;

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
        <li>
            <h3>Post #{post.id}</h3>
            <p>Author : {post.author}</p>
            <p>{post.content}</p>
        </li>
        {/each}
    </ul>
</div>