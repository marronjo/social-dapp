// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Social} from "../contracts/Social.sol"; 

contract SocialTest is Test {
    Social public social;

    function setUp() public {
        social = new Social();
    }

    function testCorrectPostsInit() public {
        assertEq(social.getAllPosts().length, 0);
    }

    function testCreatePost() public {
        social.createPost("test post");

        assertEq(social.getAllPosts()[0].id, 1);
        assertEq(social.getAllPosts()[0].content, "test post");
    }

    function testFuzz_CreatePost(string memory content) public {
        social.createPost(content);

        assertEq(social.getAllPosts()[0].id, 1);
        assertEq(social.getAllPosts()[0].content, content);
    }
}
