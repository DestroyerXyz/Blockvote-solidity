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

import { ethers } from "hardhat";

async function main() {
    console.log(process.env);
    const Blockvote = await ethers.getContractFactory("Blockvote");

    const blockvote = await Blockvote.deploy();
    console.log("Contract deployed to address:", blockvote.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
