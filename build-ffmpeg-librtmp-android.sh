#!/bin/bash

# This script builds static and shared FFmpeg libraries with librtmp support.
# 
# Before, you must edit configuration.sh file and set the correct paths, target cpu, etc...
#
# The resulting binaries will be placed inside of build directory.

. configuration.sh

cd $OPENSSL_DIR
$NDK/ndk-build -j$THREAD_COUNT

cd $LIBRTMP_DIR
./build-android.sh

cd $FFMPEG_DIR
./build-with-librtmp-android.sh

rm -rf $CURRENT_DIR/build/ffmpeg/$CPU
rm -rf $CURRENT_DIR/build/librtmp/$CPU
rm -rf $CURRENT_DIR/build/openssl/$CPU

mkdir -p $CURRENT_DIR/build/openssl/$CPU
cp -r $OPENSSL_DIR/include $CURRENT_DIR/build/openssl/$CPU/
cp -r $OPENSSL_DIR/libs $CURRENT_DIR/build/openssl/$CPU/

mkdir -p $CURRENT_DIR/build/librtmp/$CPU
cp -r $LIBRTMP_DIR/android/$CPU $CURRENT_DIR/build/librtmp/

mkdir -p $CURRENT_DIR/build/ffmpeg/$CPU
cp -r $FFMPEG_DIR/android/$CPU $CURRENT_DIR/build/ffmpeg/