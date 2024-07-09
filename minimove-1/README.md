# minimove-1

Testnet for Initia.

- The genesis event for minimove-1 testnet started at **2024-05-10T07:46:31.14938359Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0      ~  | [minimove@v0.2.12](https://github.com/initia-labs/minimove/releases/tag/v0.2.12)                   |

## Prerequisites

- Go v1.22+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/minimove).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/genesis.json).

```shell
# you can install minitiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minimove_v0.2.12_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minimove_v0.2.12_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minimove_v0.2.12_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minimove_v0.2.12_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/minimove
$ cd minimove
$ git checkout v0.2.12
$ make install

$ minitiad version --long
commit: 663279b4fbb909fb0f4f03dc99de709f7c4e3bbf
cosmos_sdk_version: v0.0.0-20240502043911-a4bdb8e06769
go: go version go1.22.3 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.12

$ minitiad init [moniker] --chain-id minimove-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/genesis.json
$ cp genesis.json ~/.minitia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.minitia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
c4779ba03f7dc74f6349307361884c26bdda9abd@35.186.158.50:26656
```
