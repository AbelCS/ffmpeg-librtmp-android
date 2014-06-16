#!/bin/bash

. configuration.sh

set -e

echo "Cleaning ffmpeg-android builds..."
rm -rf $CURRENT_DIR/build
rm -rf $FFMPEG_DIR/android
cd $FFMPEG_DIR
make clean

echo "Cleaning librtmp builds..."
rm -rf $LIBRTMP_DIR/android
cd $LIBRTMP_DIR
make clean

echo "Cleaning openssl builds..."
cd $OPENSSL_DIR
$NDK/ndk-build clean