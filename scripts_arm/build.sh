#!/bin/sh

help()
{
    echo "Need command $0 build|buildx|build-all|buildx-all"
    echo "\tbuild)\t\t builds the images with docker build"
    echo "\tbuildx)\t\t builds the images with docker buildx for platform linux/arm/v7"
    echo "\tbuild-all)\t builds all the images with docker build (including base image)"
    echo "\tbuildx-all)\t builds all the images with docker buildx for platform linux/arm/v7 (including base image)"
     
    exit
}

if [ -z "$1" ]
  then
    help 
fi

if [ ! -f ./scripts_arm/config.sh ]; then
    echo "Please execute from root dir"
    exit
fi

case  $1 in
    build)
        builder="docker build . "
        ;;
    buildx)
        builder="docker buildx build --platform linux/arm/v7 . "
        ;;
    build-all)
        builder="docker build . "
        ball=true
        ;;
    buildx-all)
        builder="docker buildx build --platform linux/arm/v7 . "
        ball=true
        ;;
    *) 
        help
        ;;
esac

source ./scripts_arm/config.sh

if [ ! -z $ball ]
  then
    echo "$builder -f Dockerfile.arm -t sawtooth-core-base-arm:$version"
fi
echo "$builder -f validator/Dockerfile.arm -t sawtooth-validator-arm:$version
$builder -f adm/Dockerfile.arm -t sawtooth-adm-arm:$version
$builder -f families/settings/Dockerfile.arm -t sawtooth-settings-tp-arm:$version
$builder -f families/smallbank/smallbank_rust/Dockerfile.arm -t smallbank-rust-tp-arm:$version
$builder -f perf/smallbank_workload/Dockerfile.arm -t smallbank-workload-arm:$version
$builder -f cli/Dockerfile.arm -t sawtooth-cli-arm:$version
$builder -f rest_api/Dockerfile.arm -t sawtooth-rest-api-arm:$version
$builder -f families/block_info/Dockerfile.arm -t block-info-tp-arm:$version
$builder -f families/identity/Dockerfile.arm -t identity-rust-tp-arm:$version"