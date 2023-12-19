# Mahalo-1

Testnet for Initia.

- The genesis event for Mahalo-1 testnet started at **2023-12-14T09:31:45.312687969Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0~      | [initia@v0.1.2-beta.11](https://github.com/initia-labs/initia/releases/tag/v0.1.2-beta.11) |

## Prerequisites

- Go v1.19+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from [here](./binaries/) or you can install from the [source code](https://github.com/initia-labs/initia).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.1.2-beta.11_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.1.2-beta.11_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.1.2-beta.11_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.1.2-beta.11_Darwin_aarch64.tar.gz


# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.1.2-beta.11
$ make install

$ initiad version --long
build_tags: netgo,ledger
commit: 35d6691a392c67e54239d893c3db42efb05dd94f
cosmos_sdk_version: v0.47.6
go: go version go1.21.5 darwin/arm64
name: initia
server_name: initiad
version: v0.1.2-beta.11

$ initiad init [moniker] --chain-id mahalo-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ initiad start
```

## How to setup validator

### Validator Creation

```sh
initiad tx mstaking create-validator \
    --amount=5000000uinit \   # It can be other LP tokens 
    --pubkey=$(initiad tendermint show-validator) \
    --moniker="<your_moniker>" \
    --chain-id=<chain_id> \
    --from=<key_name> \
    --commission-rate="0.10" \
    --commission-max-rate="0.20" \
    --commission-max-change-rate="0.01" \
    --identity=<keybase_identity> # (optional) for validator image
```

### Known Peers

```sh
12967fbee530ab012f78b11a5b6587a8b7f8846d@34.143.171.2:26656
```
