#!/bin/bash

port_num=$1

if [[ -z $1 ]]; then
    port_num=8080
fi

echo $port_num

PORT=$port_num npm start