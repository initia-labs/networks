# initiation-1

Testnet for Initia.

- The genesis event for initiation-1 testnet started at **2024-05-09T05:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0      ~  | [initia@v0.2.8](https://github.com/initia-labs/initia/releases/tag/v0.2.8)                   |

## Prerequisites

- Go v1.22+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/initia).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.8_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.8_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.8_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.8_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.2.8
$ make install

$ initiad version --long
commit: c7bbd8297cff7dd3131a93153f6c36ea021c985e
cosmos_sdk_version: v0.0.0-20240425031032-6bc18cf6e67d
go: go version go1.22.3 linux/amd64
name: initia
server_name: initiad
version: v0.2.8

$ initiad init [moniker] --chain-id initiation-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/genesis.json
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
093e1b89a498b6a8760ad2188fbda30a05e4f300@35.240.207.217:26656
```

### Seed Nodes

```sh
2692225700832eb9b46c7b3fc6e4dea2ec044a78@34.142.181.82:26656
```
