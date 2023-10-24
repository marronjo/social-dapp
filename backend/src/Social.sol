// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Social {

    struct Post {
        uint256 id;
        uint256 timestamp;
        string content;
    }
    
    uint256 public postCount;

    mapping(address => Post[]) public posts;

    event newPost(Post);

    function createPost(string calldata content) external {
        Post memory post = Post(postCount, block.timestamp, content);
        posts[msg.sender].push(post);
        postCount++;
        emit newPost(post);
    }

    function getUserPosts(address user) external view returns(Post[] memory) {
        return posts[user];
    }
}