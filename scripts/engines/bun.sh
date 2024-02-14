#!/bin/sh

# install bun
curl -fsSL https://bun.sh/install | bash

# clone repo and use bun
git clone https://github.com/CanadaHonk/porffor.git --depth 1

bun --version > version.txt

cd porffor
npm install
cd ..

./scripts/test262.sh porffor "$(pwd)/helpers/bun.sh" 16