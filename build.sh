#!/bin/bash

set -e

echo "Building..."
cd Amoeba
ghc -threaded --make -outputdir ../.bin -o ../.bin/Amoeba Main.hs
cd ..

set +e

echo "Copying..."
rm -f "./Game/Amoeba"
cp "./.bin/Amoeba" ./Game/