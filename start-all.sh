#!/bin/bash


BIN=`pwd`

EXEC=/usr/local/bin/redis-server

for node in 1 2 3
do
  echo "Start node $node"
  mkdir "$BIN/data/node$node"
  $EXEC "etc/node$node/redis.conf" --daemonize yes
done
