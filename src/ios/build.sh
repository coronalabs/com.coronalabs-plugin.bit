#!/bin/bash

# This option is used to exit the script as
# soon as a command returns a non-zero value.
set -o errexit

path=`dirname $0`

OUTPUT_DIR=$1
TARGET_NAME=plugin.bit
OUTPUT_SUFFIX=a
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
xcodebuild -project "$path/Plugin.xcodeproj" -target $TARGET_NAME -configuration $CONFIG clean

# Build iOS.
xcodebuild -project "$path/Plugin.xcodeproj" -target $TARGET_NAME -configuration $CONFIG -sdk iphoneos

# Build iOS-sim.
xcodebuild -project "$path/Plugin.xcodeproj" -target $TARGET_NAME -configuration $CONFIG -sdk iphonesimulator

# Create a universal binary.
lipo -create "$path"/build/$CONFIG-iphoneos/lib$TARGET_NAME.$OUTPUT_SUFFIX "$path"/build/$CONFIG-iphonesimulator/lib$TARGET_NAME.$OUTPUT_SUFFIX -output "$OUTPUT_DIR"/lib$TARGET_NAME.$OUTPUT_SUFFIX

echo Done.
echo "$OUTPUT_DIR"/lib$TARGET_NAME.$OUTPUT_SUFFIX
