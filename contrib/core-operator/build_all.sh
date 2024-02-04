#!/bin/bash

VERSION="v2.2.0"

pushd .. 

git checkout $VERSION
docker build -t terrarebirth/core:$VERSION .
git checkout -

popd

docker build --build-arg version=$VERSION --build-arg chainid=paradise-1 -t terrarebirth/core-node:$VERSION .
docker build --build-arg version=$VERSION --build-arg chainid=biden-1 -t terrarebirth/core-node:$VERSION-testnet .