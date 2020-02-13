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
    echo "Uploading $i"
    docker tag $i:$version $1/$i:$version
    docker push $1/$i:$version
done
exit
