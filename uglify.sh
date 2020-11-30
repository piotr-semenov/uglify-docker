#!/bin/sh

if [ "${1##*.}" = "css" ]; then
    uglifycss --expand-vars --max-line-len 500 --output "$2" "$1";
elif [ "${1##*.}" = "js" ]; then
    uglifyjs --compress --mangle --toplevel --output "$2" "$1";
fi
