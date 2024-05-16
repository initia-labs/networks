# initiation-1

Testnet for Initia.

- The genesis event for initiation-1 testnet started at **2024-05-10T07:00:00Z (UTC)**

## Binaries

| height  | link  |
| ------- | ----- |
| 0      ~  | [initia@v0.2.14](https://github.com/initia-labs/initia/releases/tag/v0.2.14)                   |

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
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.14_Linux_x86_64.tar.gz
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.14_Darwin_x86_64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.14_Linux_aarch64.tar.gz 
# $ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/initia_v0.2.14_Darwin_aarch64.tar.gz

# or, build from the source
$ git clone https://github.com/initia-labs/initia
$ cd initia
$ git checkout v0.2.14
$ make install

$ initiad version --long
commit: bc8eaa6e840dd2e9c4eaa5dfbf90e27458173ac1
cosmos_sdk_version: v0.0.0-20240514173001-c037b6c44d98
go: go version go1.22.3 linux/amd64
name: initia
server_name: initiad
version: v0.2.14

$ initiad init [moniker] --chain-id initiation-1
$ wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/genesis.json
$ cp genesis.json ~/.initia/config/genesis.json

# This will prevent continuous reconnection try. (default P2P_PORT is 26656)
$ sed -i -e 's/external_address = \"\"/external_address = \"'$(curl httpbin.org/ip | jq -r .origin)':26656\"/g' ~/.initia/config/config.toml

$ initiad start
```

## How to setup validator

Once synchronization is complete, you can try "Validator Creation". Run the following command and if "catching_up: false" then the synchronization is complete

```sh
curl http://localhost:26657/status | jq

{
  "jsonrpc": "2.0",
  "id": -1,
  "result": {
    ...
    "sync_info": {
      ...
      "earliest_block_time": "2024-05-10T07:00:00Z",
      "catching_up": false # true if not complete
    },
    ...
  }
}
```

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
2c729d33d22d8cdae6658bed97b3097241ca586c@195.14.6.129:26019
```

### Seed Nodes

```sh
2eaa272622d1ba6796100ab39f58c75d458b9dbc@34.142.181.82:26656
c28827cb96c14c905b127b92065a3fb4cd77d7f6@testnet-seeds.whispernode.com:25756
```

### Address Book

We highly recommend to copy addrbook.json to $INITIA_HOME/config/addrbook.json for fast peer connection.

Download the genesis from [here](https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/addrbook.json).

```bash
# stop initiad

wget https://initia.s3.ap-southeast-1.amazonaws.com/initiation-1/addrbook.json
mv addrbook.json ~/.initia/config/addrbook.json

# start initiad
```

### Snapshots

- <https://polkachu.com/testnets/initia/snapshots>
- <https://bwarelabs.com/snapshots/initia>
