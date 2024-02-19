# Mahalo-1

Testnet for Initia.

- The genesis event for Mahalo-1 testnet started at **2024-01-18T08:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0~      | [initia@v0.2.0-beta.6.2](https://github.com/initia-labs/initia/releases/tag/v0.2.0-beta.6.2) |
| 800000~ | [initia@v0.2.0-beta.7.1](https://github.com/initia-labs/initia/releases/tag/v0.2.0-beta.7.1) |

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
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.2.0-beta.6.2_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.2.0-beta.6.2_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.2.0-beta.6.2_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-1/initia_v0.2.0-beta.6.2_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.2.0-beta.6.2
$ make install

$ initiad version --long
commit: 342adad577ff1dede69d03af056952e0f7d07d55
cosmos_sdk_version: v0.0.0-20240123082052-77e8b246064a
go: go version go1.21.5 linux/amd64
name: initia
server_name: initiad
version: v0.2.0-beta.6.2

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
1b11f3ddc25d97fbe7f96fc4caec4c34fb26e6fa@34.143.171.2:26656
```
