#!/bin/bash

# Vars
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"

CHECK_YEAR=2014

# Functions
# Error
error_exit() {
	echo -en "$COL_RED$1$COL_RESET" 1>&2
	exit 1
}

echo ""
echo -en "$COL_YELLOW Checking for content which is not modified since "$CHECK_YEAR" ...$COL_RESET\n"
echo ""

git ls-tree -r --name-only HEAD | while read filename; do
    echo "$(git log -1 --format="%ad" -- "$filename" ) $filename" | ag "$CHECK_YEAR"
done
exit 0



