<script>
    import { ethers } from 'ethers';
    import Social from '../abi/Social.json';
    import { websocketUrl } from '../secrets.json';
    import { onMount } from 'svelte';

    export let contractAddress;

    let posts = [];

    const webSocketProvider = new ethers.providers.WebSocketProvider(websocketUrl, "goerli");
    const contract = new ethers.Contract(contractAddress, Social.abi, webSocketProvider);

    contract.on("newPost", (post) => {
        posts = [...posts, post]
    });

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

    onMount(() => getAllPosts())
</script>
<div>
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