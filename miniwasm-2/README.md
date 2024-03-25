# miniwasm-2

Testnet for Initia L2 with wasm vm.

- The genesis event for miniwasm-2 testnet started at **2024-03-25T05:39:46.760974683Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0     ~ | [miniwasm@v0.2.2](https://github.com/initia-labs/miniwasm/releases/tag/v0.2.2) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/miniwasm).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/miniwasm_v0.2.2_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/miniwasm_v0.2.2_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/miniwasm_v0.2.2_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/miniwasm_v0.2.2_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/miniwasm
$ cd miniwasm
$ git checkout v0.2.2
$ make install

$ minitiad version --long
commit: 8c4578ed7a199995422ad37b76cb0242c37b7aa1
cosmos_sdk_version: v0.0.0-20240313050640-ff14560eeb21
go: go version go1.21.5 darwin/arm64
name: minitia
server_name: minitiad
version: v0.2.2

$ minitiad init [moniker] --chain-id miniwasm-2
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-2/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
d702bdb0ad333c8b98aee5fa1d9156c6444e353a@34.87.100.162:26656
```
