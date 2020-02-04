#!/bin/bash


BIN=`pwd`

for node in 1 2 3
do
  echo "Delete dir $BIN/data/node$node"
  rm -rf "$BIN/data/node$node"
done
