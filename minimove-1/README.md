# minimove-1

Testnet for Initia L2 with move vm.

- The genesis event for minimove-1 testnet started at **2024-01-18T08:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0~      | [minimove@v0.2.0-beta.5](https://github.com/initia-labs/minimove/releases/tag/v0.2.0-beta.5) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from [here](./binaries/) or you can install from the [source code](https://github.com/initia-labs/minimove).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minitia_v0.2.0-beta.5_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minitia_v0.2.0-beta.5_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minitia_v0.2.0-beta.5_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/minitia_v0.2.0-beta.5_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/minimove
$ cd minimove
$ git checkout v0.2.0-beta.5
$ make install

$ minitiad version --long
commit: dd575fd27e9cd22f33a308242c75a7e945ef23d6
cosmos_sdk_version: v0.0.0-20240116115600-110a2328c217
go: go version go1.21.5 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.0-beta.5

$ minitiad init [moniker] --chain-id minimove-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/minimove-1/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
11c79a41511fc3804f9e5392a0311c45a1f91396@34.142.143.85:26656
```
