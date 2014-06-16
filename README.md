### FFmpeg with libRTMP for Android

This is a little bash scripts collection that can help if you want to build FFmpeg for Android with or without libRTMP support.

This is how it works:
> 1.   You need to set the appropiate NDK path, Android target platform and target cpu into the *configuration.sh* file. SYSROOT and TOOLCHAIN parameters may need to be adjusted depending on which NDK version you want to use.
> 2.   Run *build-ffmpeg-android.sh* or *build-ffmpeg-librtmp-android.sh* and wait until FFmpeg and all dependecies needed are built.
> 3.   The resulting binaries for FFmpeg and its dependencies will be placed into the build/ directory.


For now, this have only been tested in OS X with NDK r9d, so feel free to improve it and send a pull request :)

### Contributions

**OnlyInAmerica**: https://github.com/OnlyInAmerica/FFmpeg-Android.git

**The Guardian Project**: https://github.com/guardianproject/openssl-android.git