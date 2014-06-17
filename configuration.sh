#!/bin/bash

###################
#  CONFIGURATION  #
###################

NDK=/PATH/TO/YOUR/NDK # <---- MUST BE MODIFIED
 

ANDROID_TAGET_PLATFORM=android-15

ARM_TARGET_ARCH=arm # Supported: arm, armv6, armv7-vfp, armv7-vfpv3


# This values may need to be modified depending on your NDK.
SYSROOT=$NDK/platforms/$ANDROID_TAGET_PLATFORM/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/"$(uname |tr '[:upper:]' '[:lower:]')"-x86_64

#####################
# // CONFIGURATION  #
#####################



###########
# SET ENV #
###########

set -e 

export NDK
export SYSROOT
export TOOLCHAIN
export ARM_TARGET_ARCH

CURRENT_DIR=$(pwd)
export OPENSSL_DIR=$CURRENT_DIR/openssl-1.0.0a
export LIBRTMP_DIR=$CURRENT_DIR/rtmpdump-2.4
export FFMPEG_DIR=$CURRENT_DIR/ffmpeg-2.2.3


# TARGETS

case "$ARM_TARGET_ARCH" in
    'arm')
        ## arm ##
        CPU=arm
        CPU_CFLAGS="-marm"
    ;;

    'armv6')
        ## armv6 ##
        CPU=armv6
        CPU_ARCH=armv6
        CPU_CFLAGS="-marm -march=${CPU_ARCH}"
    ;;

    'armv7-vfp')
        ## armv7-vfp ##
        CPU=armv7-vfp
        CPU_ARCH=armv7-a
        CPU_CFLAGS="-marm -march=${CPU_ARCH} -mfloat-abi=softfp -mfpu=vfp"
    ;;

    'armv7-vfpv3')
        ## armv7-vfpv3 ##
        CPU=armv7-vfpv3
        CPU_ARCH=armv7-a
        CPU_CFLAGS="-marm -march=${CPU_ARCH} -mfloat-abi=softfp -mfpu=vfpv3-d16"
    ;;

    *)
        echo 'UNKNOWN ARM TARGET ARCHITECTURE'
        exit 1
    ;;
esac

export CPU
export CPU_CFLAGS


# CPU THREADS COUNT

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   THREAD_COUNT=$(nproc)
elif [[ "$unamestr" == 'Darwin' ]]; then
   THREAD_COUNT=$(sysctl -n hw.ncpu)
fi

export THREAD_COUNT=$(($THREAD_COUNT+1))

##############
# // SET ENV #
##############