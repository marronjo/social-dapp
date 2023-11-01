<script>
    import { ethers } from 'ethers';
    import Social from '../../out/Social.sol/Social.json';
    import { onMount } from 'svelte';
    import { websocketUrl } from '../../secrets.json';

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

    async function initNewPostListener(){
        const webSocketProvider = new ethers.providers.WebSocketProvider(websocketUrl, "goerli");
        const contract = new ethers.Contract(contractAddress, Social.abi, webSocketProvider);

        contract.on("newPost", (post) => {
            postCollection = [...posts, post]
        });
    }

    onMount(() => {
        getAllPosts();
        initNewPostListener();
    });
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