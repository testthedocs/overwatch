#!/bin/bash
ACTION='\033[1;90m'
FINISHED='\033[1;96m'
READY='\033[1;92m'
NOCOLOR='\033[0m' # No Color
ERROR='\033[0;31m'

git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

if [ "$HEADHASH" != "$UPSTREAMHASH" ]
then
   echo -e ${ERROR}Not up to date with origin. Aborting.${NOCOLOR}
   echo
   exit 0
else
   echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
fi
