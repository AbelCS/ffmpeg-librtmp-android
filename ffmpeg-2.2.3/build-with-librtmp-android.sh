#!/bin/bash

function build_one
{
./configure \
    --prefix=$PREFIX \
    --enable-librtmp \
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
ADDI_CFLAGS="${CPU_CFLAGS} -I${OPENSSL_DIR}/include -I${LIBRTMP_DIR}/android/${CPU}/include -L${LIBRTMP_DIR}/android/${CPU}/lib -lrtmp"
ADDI_LFLAGS="-L${OPENSSL_DIR}/libs/armeabi -L${LIBRTMP_DIR}/android/${CPU}/lib -lrtmp" 

#-L${SYSROOT}usr/lib"
export LIBRTMP_DIR
export CPU

build_one