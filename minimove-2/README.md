# minimove-2

Testnet for Initia L2 with move vm.

- The genesis event for minimove-2 testnet started at **2024-03-25T05:30:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0     ~ | [minimove@v0.2.3](https://github.com/initia-labs/minimove/releases/tag/v0.2.3) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from [here](./binaries/) or you can install from the [source code](https://github.com/initia-labs/minimove).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/minitia_v0.2.3_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/minitia_v0.2.3_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/minitia_v0.2.3_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/minitia_v0.2.3_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/minimove
$ cd minimove
$ git checkout v0.2.3
$ make install

$ minitiad version --long
commit: fce6b4a3ab2cce8ac4a40796f7db07ef3c428092
cosmos_sdk_version: v0.0.0-20240313050640-ff14560eeb21
go: go version go1.21.5 darwin/arm64
name: minitia
server_name: minitiad
version: v0.2.3

$ minitiad init [moniker] --chain-id minimove-2
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-2/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
1862f211144ec67c53c30b26d4488bf1fa47c725@34.124.237.204:26656
```
