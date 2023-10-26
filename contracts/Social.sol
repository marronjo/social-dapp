// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Social {

    struct Post {
        uint256 id;
        address author;
        uint256 timestamp;
        string content;
    }

    Post[] public posts;

    event newPost(Post);

    function createPost(string calldata content) external returns(uint256) {
        uint256 id = posts.length + 1;
        Post memory post = Post(id, msg.sender, block.timestamp, content);
        posts.push(post);
        emit newPost(post);
        return id;
    }

    function getAllPosts() external view returns(Post[] memory) {
        return posts;
    }
}