#!/bin/bash

VERSION="v2.2.0"

pushd .. 

git checkout $VERSION
docker build -t terrarebirth/core:$VERSION .  -f Dockerfile.core
git checkout -

popd

docker build --build-arg version=$VERSION --build-arg chainid=paradise-1 -t terrarebirth/core-node:$VERSION . -f Dockerfile.core
docker build --build-arg version=$VERSION --build-arg chainid=biden-1 -t terrarebirth/core-node:$VERSION-testnet . -f Dockerfile.core