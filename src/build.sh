#!/bin/bash

# This option is used to exit the script as
# soon as a command returns a non-zero value.
set -o errexit

path=`dirname $0`

PLUGIN_NAME=libplugin.bit

# 
# Canonicalize relative paths to absolute paths
# 
pushd $path > /dev/null
dir=`pwd`
path=$dir
popd > /dev/null


#
# OUTPUT_DIR
# 
OUTPUT_DIR=$path/build

# Clean build
if [ -e "$OUTPUT_DIR" ]
then
	rm -rf "$OUTPUT_DIR"
fi

# Create dst dir
mkdir "$OUTPUT_DIR"


#
# Build
#

cd "$path"
	echo "========================================================================"
	echo "Packaging plugin for SDK..."
	./build_sdk.sh "$OUTPUT_DIR" $PLUGIN_NAME
	echo "Done."

	# echo "========================================================================"
	# echo "Packaging plugin for Enterprise"
	# ./build_enterprise.sh "$OUTPUT_DIR" $PLUGIN_NAME
	# echo "Done."

	echo "========================================================================"
	echo "Build successful."
	echo "Plugin ZIP files available at: '$OUTPUT_DIR'"
cd -
