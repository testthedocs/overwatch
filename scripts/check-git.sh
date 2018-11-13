#!/bin/bash

##
# Bash script to test status of git repo, for FITS
# testing.
#
# author Carl Wilson carl@openplanetsfoundation.org
#
# This script checks a directory to ensure that:
#
#  * The directory is a git repo
#  * The repo has no uncommitted changes
#  * That a master branch exists
#  * That a branch other than master is checked out
#
# Script can takes 1 parameter:
#
#  $1 directory for Git repo
#     defaults to current directory
##

# Vars
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"

gitRepo="."
# Check the passed params to avoid disapointment
checkParams () {
	# If we have params
	if [[ "$#" -gt 0 ]]
	then
		# Check that the git repo exists
		if  [[ ! -d "$1" ]]
		then
			echo "git repository not found: $1"
			exit 1;
		fi
		gitRepo="$1"
	fi
}


# Check we're in a git repository, and there's no uncommitted changes
checkGitStatus() {
	gitstatus=$(git status --porcelain 2>&1)
	while IFS= read -r
	do
		# Check we're in a git repo
		isNotGitRepoFatal "$REPLY"

		# Other output means there's changes to commit
		if [[ ! -z "$REPLY" ]]
		then
			#echo "There are uncommitted changes in this repo: $REPLY";
                        echo -en "$COL_RED There are uncommitted changes in this repo:$COL_RESET $REPLY\n";
			exit 1;
		fi
	done <<< "$gitstatus"
}

# Test param string for not a git repo output and exit if found
isNotGitRepoFatal() {
	notGitRegEx="^fatal: Not a git repository"
	if [[ $1 =~ $notGitRegEx ]]
	then
		echo "$1"
		exit 1;
	fi
}

checkParams "$@";
checkGitStatus


