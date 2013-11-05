#!/usr/bin/env bash

# compiles Enyo assets and moves them into the www dir - Cordova will then move
# those same assets into the build target directory

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../.." && pwd )"

# run Enyo's minifying script
cd $PROJECT_DIR/enyo
./tools/deploy.sh

# move the output of the Enyo tool to the project's www directory, which will
# then be moved into each platform's build directory
cp -Rf $PROJECT_DIR/enyo/deploy/* $PROJECT_DIR/www/
