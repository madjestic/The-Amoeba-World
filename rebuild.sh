#!/bin/bash

set -e

echo "Cleaning..."

rm -fr "./.bin/*"

echo "Building..."
cd Amoeba
ghc -threaded --make -outputdir ../.bin -o ../.bin/Amoeba Amoeba.hs
cd ..

set +e

echo "Copying..."
rm -f "./Game/Amoeba"
cp "./.bin/Amoeba" "./Game/"
