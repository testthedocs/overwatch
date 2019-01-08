#!/bin/bash

# Convert Markdown to text.
# Dependencies: pandoc

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
#COL_RED=$ESC_SEQ"31;01m"


FILES=*.md
for f in $FILES
do
  # extension="${f##*.}"
  filename="${f%.*}"
  echo -en "$COL_YELLOW Converting $f to $filename.txt $COL_RESET\n"
  `pandoc $f -t plain --wrap=none -o $filename.txt`
  # uncomment this line to delete the source file.
  # rm $f
done
