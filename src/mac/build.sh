#!/bin/bash

# This option is used to exit the script as
# soon as a command returns a non-zero value.
set -o errexit

path=`dirname $0`

OUTPUT_DIR=$1
TARGET_NAME=plugin_bit
OUTPUT_SUFFIX=dylib
CONFIG=Release

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

# Clean.
xcodebuild -project "$path/Plugin.xcodeproj" -configuration $CONFIG clean

# Build Mac.
xcodebuild -project "$path/Plugin.xcodeproj" -configuration $CONFIG

# Copy to destination.
cp "$path/build/Release/$TARGET_NAME.$OUTPUT_SUFFIX" "$OUTPUT_DIR"

echo Done.
echo "$OUTPUT_DIR"/$TARGET_NAME.$OUTPUT_SUFFIX
