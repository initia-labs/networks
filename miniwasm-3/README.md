# miniwasm-3

Testnet for Initia L2 with wasm vm.

- The genesis event for miniwasm-3 testnet started at **2024-04-29T04:18:05.700865539Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0     ~ | [miniwasm@v0.2.9](https://github.com/initia-labs/miniwasm/releases/tag/v0.2.9) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/miniwasm).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/miniwasm_v0.2.9_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/miniwasm_v0.2.9_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/miniwasm_v0.2.9_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/miniwasm_v0.2.9_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/miniwasm
$ cd miniwasm
$ git checkout v0.2.9
$ make install

$ minitiad version --long
commit: fbf17463935c8af6ecb42e5625e247cdccf0c73b
cosmos_sdk_version: v0.0.0-20240425031032-6bc18cf6e67d
go: go version go1.22.2 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.9

$ minitiad init [moniker] --chain-id miniwasm-3
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-3/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
c8118c3a86990e9aaead3c4c5bf6833f6a8c70a3@34.124.190.216:26656
```
