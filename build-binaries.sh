# Argument validation
if [ "$1" != "mahalo-3" ]; then
    echo "Error: Missing or invalid arguments. Usage: $0 <network>"
    exit 1
fi

if [ "$1" == "mahalo-3" ]; then
    L1_VERSION="v0.2.7"
    MINIMOVE_VERSION="v0.2.8"
    MINIWASM_VERSION="v0.2.9"
    MOVEVM_VERSION="v0.2.7"
    WASMVM_VERSION="v1.5.2"

    L1_NETWORK_NAME="mahalo-3"
    MINIMOVE_NETWORK_NAME="minimove-3"
    MINIWASM_NETWORK_NAME="miniwasm-3"
fi

ARCH=$(uname -m | sed -e "s/arm64/aarch64/")

# l1

mkdir -p ./"$L1_NETWORK_NAME"/binaries

(
    cd ../initia \
    && git fetch --all --tags && git checkout "$L1_VERSION"
)

(
    cd ../initia \
    && make build \
    && cd ./build \
    && cp ~/go/pkg/mod/github.com/initia-labs/movevm@"$MOVEVM_VERSION"/api/libmovevm.dylib ./ \
    && cp ~/go/pkg/mod/github.com/initia-labs/movevm@"$MOVEVM_VERSION"/api/libcompiler.dylib ./ \
    && tar -czvf initia_"$L1_VERSION"_Darwin_"$ARCH".tar.gz initiad libmovevm.dylib libcompiler.dylib \
    && mv ./initia_"$L1_VERSION"_Darwin_"$ARCH".tar.gz ../../networks/"$L1_NETWORK_NAME"/binaries/ \
    && rm -rf ./libmovevm.dylib ./libcompiler.dylib ./initiad
)

(
    cd ../initia \
    && make build-linux-with-shared-library \
    && cd ./build \
    && mv libmovevm.so libmovevm."$ARCH".so \
    && mv libcompiler.so libcompiler."$ARCH".so \
    && tar -czvf initia_"$L1_VERSION"_Linux_"$ARCH".tar.gz ./initiad libmovevm."$ARCH".so libcompiler."$ARCH".so \
    && mv ./initia_"$L1_VERSION"_Linux_"$ARCH".tar.gz ../../networks/"$L1_NETWORK_NAME"/binaries/ \
    && rm -rf ./libmovevm."$ARCH".so ./libcompiler."$ARCH".so ./initiad
)

# minimove

mkdir -p ./"$MINIMOVE_NETWORK_NAME"/binaries

(
    cd ../minimove \
    && git fetch --all --tags && git checkout "$MINIMOVE_VERSION"
)

(
    cd ../minimove \
    && make build \
    && cd ./build \
    && cp ~/go/pkg/mod/github.com/initia-labs/movevm@"$MOVEVM_VERSION"/api/libmovevm.dylib ./ \
    && cp ~/go/pkg/mod/github.com/initia-labs/movevm@"$MOVEVM_VERSION"/api/libcompiler.dylib ./ \
    && tar -czvf minimove_"$MINIMOVE_VERSION"_Darwin_"$ARCH".tar.gz minitiad libmovevm.dylib libcompiler.dylib \
    && mv ./minimove_"$MINIMOVE_VERSION"_Darwin_"$ARCH".tar.gz ../../networks/"$MINIMOVE_NETWORK_NAME"/binaries/ \
    && rm -rf ./libmovevm.dylib ./libcompiler.dylib ./minitiad
)

(
    cd ../minimove \
    && make build-linux-with-shared-library \
    && cd ./build \
    && mv libmovevm.so libmovevm."$ARCH".so \
    && mv libcompiler.so libcompiler."$ARCH".so \
    && tar -czvf minimove_"$MINIMOVE_VERSION"_Linux_"$ARCH".tar.gz ./minitiad libmovevm."$ARCH".so libcompiler."$ARCH".so \
    && mv ./minimove_"$MINIMOVE_VERSION"_Linux_"$ARCH".tar.gz ../../networks/"$MINIMOVE_NETWORK_NAME"/binaries/ \
    && rm -rf ./libmovevm."$ARCH".so ./libcompiler."$ARCH".so ./minitiad
)

# miniwasm

mkdir -p ./"$MINIWASM_NETWORK_NAME"/binaries

(
    cd ../miniwasm \
    && git fetch --all --tags && git checkout "$MINIWASM_VERSION"
)

(
    cd ../miniwasm \
    && make build \
    && cd ./build \
    && cp ~/go/pkg/mod/github.com/\!cosm\!wasm/wasmvm@"$WASMVM_VERSION"/internal/api/libwasmvm.dylib ./ \
    && tar -czvf miniwasm_"$MINIWASM_VERSION"_Darwin_"$ARCH".tar.gz ./minitiad libwasmvm.dylib \
    && mv ./miniwasm_"$MINIWASM_VERSION"_Darwin_"$ARCH".tar.gz ../../networks/"$MINIWASM_NETWORK_NAME"/binaries/ \
    && rm -rf ./libwasmvm.dylib ./minitiad
)

(
    cd ../miniwasm \
    && make build-linux-with-shared-library \
    && cd ./build \
    && mv libwasmvm.so libwasmvm."$ARCH".so \
    && tar -czvf miniwasm_"$MINIWASM_VERSION"_Linux_"$ARCH".tar.gz ./minitiad libwasmvm."$ARCH".so \
    && mv ./miniwasm_"$MINIWASM_VERSION"_Linux_"$ARCH".tar.gz ../../networks/"$MINIWASM_NETWORK_NAME"/binaries/ \
    && rm -rf ./libwasmvm."$ARCH".so ./minitiad
)
