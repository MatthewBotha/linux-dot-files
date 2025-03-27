#!/usr/bin/bash

function jfmt() {
    if [ ! -z $1 ]; then
        echo "$1" | jq .
    fi
}
