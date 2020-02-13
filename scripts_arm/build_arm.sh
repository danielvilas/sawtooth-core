#!/bin/sh

#docker build . -f Dockerfile.arm -t sawtooth-core-base-arm:1.2.4
docker build . -f validator/Dockerfile.arm -t sawtooth-validator-arm:1.2.4
docker build . -f adm/Dockerfile.arm -t sawtooth-adm-arm:1.2.4
docker build . -f families/settings/Dockerfile.arm -t sawtooth-settings-tp-arm:1.2.4
docker build . -f families/smallbank/smallbank_rust/Dockerfile.arm -t smallbank-rust-tp-arm:1.2.4
docker build . -f perf/smallbank_workload/Dockerfile.arm -t smallbank-workload-arm:1.2.4
docker build . -f cli/Dockerfile.arm -t sawtooth-cli-arm:1.2.4
docker build . -f rest_api/Dockerfile.arm -t sawtooth-rest-api-arm:1.2.4
docker build . -f families/block_info/Dockerfile.arm -t block-info-tp-arm:1.2.4
docker build . -f families/identity/Dockerfile.arm -t identity-rust-tp-arm:1.2.4

