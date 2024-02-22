# miniwasm-1

Testnet for Initia L2 with wasm vm.

- The genesis event for miniwasm-1 testnet started at **2024-01-18T08:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0     ~ 49850 | [miniwasm@v0.2.0-beta.2](https://github.com/initia-labs/miniwasm/releases/tag/v0.2.0-beta.2) |
| 49851 ~       | [miniwasm@v0.2.0-beta.3](https://github.com/initia-labs/miniwasm/releases/tag/v0.2.0-beta.3) |

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
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.0-beta.2_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.0-beta.2_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.0-beta.2_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/miniwasm_v0.2.0-beta.2_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/miniwasm
$ cd miniwasm
$ git checkout v0.2.0-beta.2
$ make install

$ minitiad version --long
commit: d6e143557213ea5f1cb099c0667321ef4c81df8a
cosmos_sdk_version: v0.0.0-20240116115600-110a2328c217
go: go version go1.21.5 linux/amd64
name: minitia
server_name: minitiad
version: v0.2.0-beta.2

$ minitiad init [moniker] --chain-id miniwasm-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/miniwasm-1/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ minitiad start
```

### Known Peers

```sh
64c67436eab6307504f8897cde93a517df79294e@34.126.113.169:26656
```
