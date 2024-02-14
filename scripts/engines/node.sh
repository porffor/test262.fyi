#!/bin/sh

# clone repo and use node
git clone https://github.com/CanadaHonk/porffor.git --depth 1

cd porffor
git rev-parse HEAD > ../version.txt

npm install
cd ..

./scripts/test262.sh porffor "$(pwd)/helpers/node.sh" 16