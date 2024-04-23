# Mahalo-2

Testnet for Initia.

- The genesis event for Mahalo-2 testnet started at **2024-01-18T08:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0~      | [initia@v0.2.3-hotfix.1](https://github.com/initia-labs/initia/releases/tag/v0.2.3-hotfix.1) |

## Prerequisites

- Go v1.21+ or higher
- Git
- curl
- jq

## How to Setup

Install binaries from s3 or you can install from the [source code](https://github.com/initia-labs/initia).

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/genesis.json).

```shell
# you can install initiad from the s3
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/initia_v0.2.3-hotfix.1_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/initia_v0.2.3-hotfix.1_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/initia_v0.2.3-hotfix.1_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/initia_v0.2.3-hotfix.1_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.2.3-hotfix.1
$ make install

$ initiad version --long
commit: c2c24070c619e61f27e5a33a2df417936c8481e1
cosmos_sdk_version: v0.0.0-20240313050640-ff14560eeb21
go: go version go1.21.5 darwin/arm64
name: initia
server_name: initiad
version: v0.2.3-hotfix.1

$ initiad init [moniker] --chain-id mahalo-2
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/mahalo-2/genesis.json
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
09446781fcc4cb0dc6b9331ab4fbe2bc6808fc15@34.87.121.251:26656
```
