#!/bin/bash

path=`dirname $0`

OUTPUT_DIR=$1
OUTPUT_SUFFIX=a
CONFIG=Release

#
# Checks exit value for error
# 
checkError() {
    if [ $? -ne 0 ]
    then
        echo "Exiting due to errors (above)"
        exit -1
    fi
}

# 
# Canonicalize relative paths to absolute paths
# 
pushd $path > /dev/null
dir=`pwd`
path=$dir
popd > /dev/null

if [ -z "$OUTPUT_DIR" ]
then
    OUTPUT_DIR=.
fi

pushd $OUTPUT_DIR > /dev/null
dir=`pwd`
OUTPUT_DIR=$dir
popd > /dev/null

echo "OUTPUT_DIR: $OUTPUT_DIR"

# tvOS
xcodebuild -project "$path/Plugin.xcodeproj" -alltargets -configuration "$CONFIG"
checkError

# Copy universal binary.
cp -r "$path"/build/Release-universal/*.framework "$OUTPUT_DIR"
