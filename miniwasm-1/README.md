# miniwasm-1

Testnet for Initia.

- The genesis event for miniwasm-1 testnet started at **2024-05-09T06:52:37.894923473Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0      ~  | [miniwasm@v0.2.13](https://github.com/initia-labs/miniwasm/releases/tag/v0.2.13)                   |

## Prerequisites

- Go v1.22+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/miniwasm).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/genesis.json).

```shell
# you can install minitiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.13_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.13_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.13_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.13_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/miniwasm
$ cd miniwasm
$ git checkout v0.2.13
$ make install

$ minitiad version --long
commit: e7aa29016058261a8c3eac61eda2a3cbebe05903
cosmos_sdk_version: v0.0.0-20240502043911-a4bdb8e06769
go: go version go1.22.3 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.13

$ minitiad init [moniker] --chain-id miniwasm-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/genesis.json
$ cp genesis.json ~/.minitia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
945fa00c8256d41f69f851080583dfabdeb5898d@35.240.203.177:26656
```
