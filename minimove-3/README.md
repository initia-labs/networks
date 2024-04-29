# minimove-3

Testnet for Initia L2 with move vm.

- The genesis event for minimove-3 testnet started at **2024-04-29T04:18:01.31203431Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0     ~ | [minimove@v0.2.7](https://github.com/initia-labs/minimove/releases/tag/v0.2.7) |

## Prerequisites

- Go v1.22+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/minimove).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/minitia_v0.2.7_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/minitia_v0.2.7_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/minitia_v0.2.7_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/minitia_v0.2.7_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/minimove
$ cd minimove
$ git checkout v0.2.7
$ make install

$ minitiad version --long
commit: e775821e47b309fc72d6653a7e6bbdfd71d110e2
cosmos_sdk_version: v0.0.0-20240425031032-6bc18cf6e67d
go: go version go1.22.2 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.7

$ minitiad init [moniker] --chain-id minimove-3
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-3/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
d7c525094f8fa12e2e6df463d2887db66985f8f2@35.198.215.41:26656
```
