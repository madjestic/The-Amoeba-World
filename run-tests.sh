#!/bin/bash

echo Building tests...

rm -rf ./Temp/TestBin/*
rm -rf ./Temp/Test/*   

cd ./Amoeba/Test/
FILES=`ls`
cd ..

for f in $FILES
do
    ghc -threaded -outputdir ../Temp/TestBin -o ../Temp/Test/${f%%.hs}.bin ./Test/$f
done

chmod u+x ../Temp/Test/*.bin
cd ..

echo Running tests...

cd ./Temp/Test/
FILES=`ls`

for f in $FILES
do
    ./$f
done

cd ../..