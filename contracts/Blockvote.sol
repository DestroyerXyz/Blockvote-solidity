// SPDX-License-Identifier: Apache-2.0
//    Copyright 2022 Shreyans Jain <DestroyerXyz> <shreyansthebest2007@gmail.com>
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

contract Blockvote {
    uint public postcount;

    struct Post {
        uint id;
        address poster;
        string title;
        string description;
        mapping(uint8 => Option) options;
        // Option option1;
        // Option option2;
        // Option option3;
        // Option option4;
    }

    struct Option {
        string option;
        uint votes;
        mapping(address => bool) voters;
    }

    mapping(uint => Post) public posts;

    constructor() public {
        postcount = 0;
        string
            memory dntgtgts = "Definitely need to give this guy the scholarship";
        createPost(
            "Hi TKS People!",
            "This is the initial post created on the blockchain. Create new ones with the 'New Post' button above. Thanks!",
            [dntgtgts, dntgtgts, dntgtgts, dntgtgts]
        );
    }

    function createPost(
        string memory title,
        string memory description,
        string[4] memory optionsArray
    ) public payable returns (uint) {
        address[] memory adr = new address[](1);
        adr[0] = msg.sender;
        posts[postcount] = Post({
            id: postcount,
            poster: msg.sender,
            title: title,
            description: description
        });
        for (uint8 i = 0; i < 4; i++) {
            posts[postcount].options[i] = Option({
                option: optionsArray[i],
                votes: 0
            });
        }
        postcount++;
        return postcount - 1;
    }

    function vote(uint postid, uint8 option) public payable returns (uint8) {
        if (postid >= postcount) {
            return 1;
        } else if (posts[postid].poster == msg.sender) {
            return 2;
        } else if (
            posts[postid].options[0].voters[msg.sender] == true ||
            posts[postid].options[1].voters[msg.sender] == true ||
            posts[postid].options[2].voters[msg.sender] == true ||
            posts[postid].options[3].voters[msg.sender] == true
        ) {
            return 3;
        } else {
            posts[postid].options[option].voters[msg.sender] = true;
            posts[postid].options[option].votes++;
            return 0;
        }
    }

    function fetchPostcount() public view returns (uint) {
        return postcount;
    }

    function fetchPosts(uint postid)
        public
        view
        returns (
            address,
            string memory,
            string memory,
            string[4] memory,
            uint[4] memory
        )
    {
        return (
            posts[postid].poster,
            posts[postid].title,
            posts[postid].description,
            [
                posts[postid].options[0].option,
                posts[postid].options[1].option,
                posts[postid].options[2].option,
                posts[postid].options[3].option
            ],
            [
                posts[postid].options[0].votes,
                posts[postid].options[1].votes,
                posts[postid].options[2].votes,
                posts[postid].options[3].votes
            ]
        );
    }
}
