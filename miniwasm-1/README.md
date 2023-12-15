# miniwasm-1

Testnet for Initia L2 with wasm vm.

- The genesis event for miniwasm-1 testnet started at **2023-12-15T07:06:48.908997863Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0~      | [miniwasm@v0.1.1-beta.0](https://github.com/initia-labs/miniwasm/releases/tag/v0.1.1-beta.0) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from [here](./binaries/) or you can install from the [source code](https://github.com/initia-labs/miniwasm).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/minitia_v0.1.1-beta.0_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/minitia_v0.1.1-beta.0_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/minitia_v0.1.1-beta.0_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/minitia_v0.1.1-beta.0_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/miniwasm
$ cd miniwasm
$ git checkout v0.1.1-beta.0
$ make install

$ minitiad version --long
build_tags: netgo,ledger
commit: e506c5058d8e411505576883e6289048ec245803
cosmos_sdk_version: v0.47.6
go: go version go1.21.5 darwin/arm64
name: minitia
server_name: minitiad
version: v0.1.1-beta.0

$ minitiad init [moniker] --chain-id miniwasm-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
c0242c5585d93e2d07a3560101df4c5534cfe35e@34.126.113.169:26656
```
