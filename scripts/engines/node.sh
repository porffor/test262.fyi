#!/bin/sh

# clone repo and use node
git clone https://github.com/CanadaHonk/porffor.git --depth 1

nodever="$(node --version)"
echo "${nodever:1}" > version.txt

cd porffor
npm install
cd ..

./scripts/test262.sh porffor "$(pwd)/helpers/node.sh" 16