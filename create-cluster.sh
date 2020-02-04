#!/bin/bash

export IP=127.0.0.1

redis-cli --cluster create $IP:7000 $IP:7001 $IP:7002 --cluster-replicas 0
