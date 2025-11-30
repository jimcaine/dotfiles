#!/usr/bin/env bash
set -e

echo 'Downloading demo videos.'
mkdir -p $HOME/Videos
BIG_BUCK_BUNNY_URL='https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_640x360.m4v'
echo "  Downloading Big Buck Bunny from ${BIG_BUCK_BUNNY_URL}"
curl -o $HOME/Videos/big-buck-bunny.mp4 $BIG_BUCK_BUNNY_URL
