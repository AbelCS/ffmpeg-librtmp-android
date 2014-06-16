#!/bin/bash

function build_one
{
./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-static \
    --disable-doc \
    --disable-programs \
    --disable-doc \
    --disable-symver \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS"

make clean
make -j$THREAD_COUNT
make install
}

PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="${CPU_CFLAGS}"

#-L${SYSROOT}usr/lib"
export LIBRTMP_DIR
export CPU

build_one