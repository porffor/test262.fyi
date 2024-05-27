#!/bin/bash

# clone repo and use node
git clone https://github.com/CanadaHonk/porffor.git --depth 1

node --version | cut -c2- > version.txt

cd porffor
npm install
cd ..

./scripts/test262.sh porffor "$(pwd)/helpers/o2.sh" 16