
#!/bin/bash

cargo build --target wasm32-unknown-unknown --release

if ! command -v ic-cdk-optimizer &> /dev/null
then
    cargo install ic-cdk-optimizer
fi

ic-cdk-optimizer \
    target/wasm32-unknown-unknown/release/read_rs.wasm \
    -o read_rs_opt.wasm