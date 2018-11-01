#!/bin/bash

git ls-tree -r --name-only HEAD | while read filename; do
    echo "$(git log -1 --format="%ai" -- "$filename") $filename"
done | sort -r
