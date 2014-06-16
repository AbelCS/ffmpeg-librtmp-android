#!/bin/bash

function build_one
{
    cd librtmp
    set -ei
    make clean
    ln -s ${SYSROOT}usr/lib/crtbegin_so.o
    ln -s ${SYSROOT}usr/lib/crtend_so.o
    export XLDFLAGS="$ADDI_LDFLAGS -L${OPENSSL_DIR}/libs/armeabi -L${SYSROOT}/usr/lib"
    export CROSS_COMPILE=$TOOLCHAIN/bin/arm-linux-androideabi-
    export XCFLAGS="${ADDI_CFLAGS} -I${OPENSSL_DIR}/include -isysroot ${SYSROOT}"
    export INC="-I${SYSROOT}"
    make prefix=\"${PREFIX}\" OPT= install
}

PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="${CPU_CFLAGS}"
build_one
