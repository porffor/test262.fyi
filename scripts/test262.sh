#!/bin/sh

# clone test262
git clone https://github.com/tc39/test262.git --depth 1
cd test262

# install test262 harness (our fork - https://github.com/CanadaHonk/test262-harness)
npm install -g github:CanadaHonk/test262-harness

echo running test262...

start=`date +%s`
NODE_OPTIONS="--max-old-space-size=4096" test262-harness --host-type="$1" --host-path="$2" --reporter=json --reporter-keys=file,result,scenario,attrs --timeout=5000 --threads=$3 --preprocessor="$4" --transformer="$5" "test/**/*.js" > "../results$CHUNK_NUMBER.json"
end=`date +%s`

echo "$((end-start))" > "../time$CHUNK_NUMBER.txt"

git rev-parse HEAD > ../test262-rev.txt