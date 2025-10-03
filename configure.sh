#!/bin/zsh

if [ "$#" -ne 1 ]; then
    echo "usage: $0 [ arm64 | amd64 ]" 1>&2
    exit 1
fi


if [ "$1" = "arm64" ]; then
    arch=arm64
elif [ "$1" = "amd64" ]; then
    arch=amd64
else
    echo "unrecognized platform $1" 1>&2
    exit 1
fi

MY_DIR=$(cd `dirname $0` && pwd)
if [ $(pwd) = "$MY_DIR" ]; then
    mkdir -p bin; cd bin
fi

rm -f CMakeCache.txt
exec cmake -G Ninja -DARCH=$arch -DCMAKE_TOOLCHAIN_FILE=$MY_DIR/toolchain-$arch.cmake $MY_DIR
