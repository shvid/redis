#!/bin/bash

EXEC=/usr/local/bin/redis-server

ps -fA | grep $EXEC | awk '{print $2}' | xargs kill -9
ps -fA | grep $EXEC 
