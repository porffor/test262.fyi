#!/bin/bash

# install deno
curl -fsSL https://deno.land/install.sh | sh

# clone repo and use deno
git clone https://github.com/CanadaHonk/porffor.git --depth 1

"$HOME/.deno/bin/deno" --version | head -n 1 | awk '{ print $2 }' > version.txt

cd porffor
npm install
cd ..

./scripts/test262.sh porffor "$(pwd)/helpers/deno.sh" 16