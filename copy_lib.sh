#!/bin/bash
APK_LIB_PATH=/f/code/media/LearnFFmpeg/app/src/main/jniLibs
APK_H_PATH=/f/code/media/LearnFFmpeg/app/src/main/cpp/include

function choose_build(){
    CPU=$1
	LIB_TYPE=$2
    echo "CPU $CPU"
    if [[ $CPU = 'armv7-a' ]];
    then
        ABI='armeabi-v7a'
    elif [[ $CPU = 'armv8-a' ]];
    then
        ABI='arm64-v8a'
    else
        echo "Input Is Error."
    fi

    PREFIX=$(pwd)/android/$ABI
	
	if [[ $LIB_TYPE = 'static' ]];
    then
        cp -rf $PREFIX/lib/*.a $APK_LIB_PATH/$ABI/
    elif [[ $LIB_TYPE = 'armv8-a' ]];
    then
        cp -rf $PREFIX/lib/*.so $APK_LIB_PATH/$ABI/
    else
        echo "Input Is Error."
    fi
}

function copy_head_file(){
	cp -rf $PREFIX/include/* $APK_H_PATH/
}

choose_build armv7-a static
choose_build armv8-a static
copy_head_file

