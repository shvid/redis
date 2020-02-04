#!/bin/bash


BIN=`pwd`

EXEC=/usr/local/bin/redis-server

echo "Start Redis from $BIN."
echo "1. Interactive"
echo "2. Background"

read -p 'Select mode [N]:' mode

FLAG=

if [[ "$mode" == "1" ]]; then
   FLAG=
elif [[ "$mode" == "2" ]]; then
   FLAG="--daemonize yes"
else
   echo "Wrong mode number"
   exit
fi

read -p 'Select node number [N]:' node

PORT=6999
EXT_PORT=16999

if [[ "$node" == "1" ]]; then
   PORT=7000
   EXT_PORT=17000
elif [[ "$node" == "2" ]]; then
   PORT=7001
   EXT_PORT=17001
 elif [[ "$node" == "3" ]]; then
    PORT=7002
    EXT_PORT=17002
else
   echo "Wrong node number"
   exit
fi

echo "Starting at port $PORT and $EXT_PORT"

mkdir "$BIN/data/node$node"
$EXEC "etc/node$node/redis.conf" $FLAG

#docker run $FLAG --rm -v "$BIN/etc/node$node:/usr/local/etc/redis"  -v "$BIN/data/node$node:/usr/local/var/db/redis" --name redis$node -p $PORT:$PORT -p $EXT_PORT:$EXT_PORT -net redis_cluster redis redis-server /usr/local/etc/redis/redis.conf
