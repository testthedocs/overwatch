#!/bin/bash

FILE=CHANGELOG.md

VERSION=$(cat VERSION)
CHECK=$(cat CHANGELOG.md | grep '^##\.*' | awk 'NR==1{print $2}')

#echo $CHECK

if [ "VERSION" == "CHECK" ]; then
	echo "All good"
else
	echo "The version numbers in CHANGELOG.md and VERSION are different"
fi
