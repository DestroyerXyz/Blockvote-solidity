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

const { expect } = require("chai");
import { ethers } from "hardhat";

describe("Blockvote", function () {
    it("Test constructor", async function () {
        const [owner] = await ethers.getSigners();

        const Blockvote = await ethers.getContractFactory("Blockvote");

        const deploy = await Blockvote.deploy();

        const postcount = await deploy.postcount();

        const posts = await deploy.fetchPosts(0);

        const vote = await deploy.vote(0, 0);

        const voteWait = await vote.wait();

        const transaction = await voteWait.status;

        const posts2 = await deploy.fetchPosts(0);

        console.log(
            "Postcount: ",
            postcount,
            "\n POST:",
            posts,
            "\n VOTE:",
            voteWait,
            "\n POST2:",
            posts2,
            "\n STATUS:",
            transaction
        );
    });
});
