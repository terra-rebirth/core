# Terra Core Dockerized

## Common usage examples 

### Mainnet 

Standard options with LCD enabled: 

```
docker run -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle
```

LCD disabled: 

```
docker run -e ENABLE_LCD=false -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle
```

Custom gas fees: 

```
docker run -e MINIMUM_GAS_PRICES="0.01133uluna,0.15uusd,0.104938usdr,169.77ukrw,428.571umnt,0.125ueur,0.98ucny,16.37ujpy,0.11ugbp,10.88uinr,0.19ucad,0.14uchf,0.19uaud,0.2usgd,4.62uthb,1.25usek,1.25unok,0.9udkk,2180.0uidr,7.6uphp,1.17uhkd" -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle
```

Starting the sync from a snapshot:

```
docker run -e SNAPSHOT_NAME="columbus-5-pruned.20211022.0410.tar.lz4" -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle
```

You can find the latest snapshots [here](https://quicksync.io/networks/terra.html).

Custom snapshot URL:

```
docker run -e SNAPSHOT_BASE_URL="https://get.quicksync.io" -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle
```

**Note:** We recommend copying a snapshot to S3 or another file store and using the above options to point the container to your snapshot. The default snapshot name included will be obsolete and removed in a matter of days.

Starting a bombay node: 

```
docker run -it -p 1317:1317 -p 26657:26657 -p 26656:26656 terramoney/core-node:v0.5.11-oracle-testnet
```

## 2-Building the Docker images

```
cd ~/core
./contrib/core-operator/build_all.sh
```
## output 

```
terrarebirth/core-node v2.2.0           07c907dd1c86   2 minutes ago   62.6MB
terrarebirth/core-node v2.2.0-testnet   07c907dd1c86   2 minutes ago   62.6MB
```

# START UP WITH FULLNODE USING DOCKER

## preliminary setting 


## 1-Building Dockerfile.core
```
cd ~/core
docker build -t terrarebirth/core:ubuntu.22.04 -f ./contrib/node-validator/Dockerfile.core .
```
## 2-Building Dockerfile.node
```
cd ~/core/contrib/node-validator
docker build -t terrarebirth/fullnode:ubuntu.22.04 -f ~/core/contrib/node-validator/Dockerfile.node .
```
### 3-Docker-compose
cd ~/core/contrib/node-validator
docker compose up
