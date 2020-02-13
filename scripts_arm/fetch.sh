#!/bin/sh

if [ -z "$1" ]
  then
    echo "No argument supplied - need repository owner (danielvilas)"
    exit

source config.sh

for i in $images
do
    echo "Downloading $i"
    docker pull $1/$i:$version
    docker tag $1/$i:$version $i:$version
done
exit
