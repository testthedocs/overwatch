#!/bin/bash

# Convert Markdown to docx.
# Dependencies: pandoc

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"


FILES="*.md"
for f in $FILES; do
  # extension="${f##*.}"
  filename="${f%.*}"
  echo -en "$COL_YELLOW Converting $f to $filename.docx $COL_RESET\n"
  pandoc "$f" -t docx --wrap=preserve -o "$filename".docx
  # uncomment this line to delete the source file.
  # rm $f
done
