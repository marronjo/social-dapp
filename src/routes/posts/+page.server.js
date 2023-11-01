import { WEBSOCKET_URL } from '$env/static/private';
import { ethers } from 'ethers';
import Social from '../out/Social.sol/Social.json';

export function load() {
	console.log("Init websocket : " + WEBSOCKET_URL);

	// let postCollection = []

	// const webSocketProvider = new ethers.providers.WebSocketProvider(WEBSOCKET_URL, "goerli");
	// const contract = new ethers.Contract("0x3585004F86af7b95B8aD63a898C90279B101b678", Social.abi, webSocketProvider);

	// contract.on("newPost", (post) => {
	// 	postCollection = [...posts, post]
	// });

	// return {
	// 	posts : postCollection
	// }
}

export const actions = {
	default: async () => {
		console.log(WEBSOCKET_URL);
	}
};