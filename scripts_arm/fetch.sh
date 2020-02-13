#!/bin/sh

if [ -z "$1" ]
  then
    echo "No argument supplied - need repository owner (danielvilas)"
    exit
fi

if [ ! -f ./scripts_arm/config.sh ]; then
    echo "Please execute from root dir"
    exit
fi

source ./scripts_arm/config.sh

for i in $images
do
    echo "Downloading $i"
    docker pull $1/$i:$version
    docker tag $1/$i:$version $i:$version
done
exit
