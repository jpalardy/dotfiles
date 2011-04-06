#!/bin/bash

compressed=$(curl -s --compressed -w "%{size_download}" -o /dev/null $1)
echo $compressed

uncompressed=$(curl -s -w "%{size_download}" -o /dev/null $1)
echo $uncompressed

echo "$compressed / $uncompressed" | bc -lq

