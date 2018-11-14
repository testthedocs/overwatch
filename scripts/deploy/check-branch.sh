#!/bin/bash
ACTION='\033[1;90m'
FINISHED='\033[1;96m'
READY='\033[1;92m'
NOCOLOR='\033[0m' # No Color
ERROR='\033[0;31m'

echo
echo -e ${ACTION}Checking Git repo
echo -e =======================${NOCOLOR}
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "master" ]
  then
   echo -e ${ERROR}Not on master. Aborting. ${NOCOLOR}
   echo
   exit 0
fi

