# Mahalo-3

Testnet for Initia.

- The genesis event for Mahalo-3 testnet started at **2024-04-29T03:09:16.487325519Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0      ~  | [initia@v0.2.6](https://github.com/initia-labs/initia/releases/tag/v0.2.6)                   |

## Prerequisites

- Go v1.22+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/initia).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/initia_v0.2.6_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/initia_v0.2.6_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/initia_v0.2.6_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/initia_v0.2.6_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.2.6
$ make install

$ initiad version --long
commit: ed56ff12414da1e38c473882fcc083d6007af6b8
cosmos_sdk_version: v0.0.0-20240425031032-6bc18cf6e67d
go: go version go1.22.2 linux/amd64
name: initia
server_name: initiad
version: v0.2.6

$ initiad init [moniker] --chain-id mahalo-3
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-3/genesis.json
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
1ded63cb0e28012d0104682226e57d967afb78f8@35.247.153.122:26656
```
