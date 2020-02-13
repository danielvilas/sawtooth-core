#!/bin/sh

docker build . -f Dockerfile.arm -t sawtooth-core-base-arm:1.2.4
docker build . -f validator/Dockerfile.arm -t danielvilas/sawtooth-validator-arm:1.2.4
docker build . -f adm/Dockerfile.arm -t danielvilas/sawtooth-adm-arm:1.2.4
#docker build . -f families/settings/Dockerfile.arm -t danielvilas/sawtooth-settings-tp-arm:1.2.4
#docker build . -f families/smallbank/smallbank_rust/Dockerfile.arm -t danielvilas/smallbank-rust-tp-arm:1.2.4
#docker build . -f perf/smallbank_workload/Dockerfile.arm -t danielvilas/smallbank-workload-arm:1.2.4
#docker build . -f cli/Dockerfile.arm -t danielvilas/sawtooth-cli-arm:1.2.4
docker build . -f rest_api/Dockerfile.arm -t danielvilas/sawtooth-rest-api-arm:1.2.4
#docker build . -f families/block_info/Dockerfile.arm -t danielvilas/block-info-tp-arm:1.2.4
#docker build . -f families/identity/Dockerfile.arm -t danielvilas/identity-rust-tp-arm:1.2.4

