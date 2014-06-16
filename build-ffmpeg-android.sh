#!/bin/bash

# This script builds static and shared FFmpeg libraries.
# 
# Before, you must edit configuration.sh file and set the correct paths, target cpu, etc...
#
# The resulting binaries will be placed inside of build directory.

. configuration.sh

cd $FFMPEG_DIR
./build-android.sh

rm -rf $CURRENT_DIR/build/ffmpeg/$CPU
mkdir -p $CURRENT_DIR/build/ffmpeg/$CPU
cp -r $FFMPEG_DIR/android/$CPU $CURRENT_DIR/build/ffmpeg/
