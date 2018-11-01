#!/bin/sh



FILES=$(git ls-tree --name-only HEAD .)
MAXLEN=0
IFS=$(printf "\n\b")
counter=0
for f in $FILES; do
    if [ ${#f} -gt $MAXLEN ]; then
        MAXLEN=${#f};
    fi
    counter=$((counter + 1))
done
MAXLEN=$((MAXLEN+1)) # Consider slash at the end of dirname

number_of_files=$counter
space_for_file_numbers=${#number_of_files}

# colors definitions
blue=$(tput setaf 27)
normal=$(tput setaf 255)
black_bg=$(tput setab 233)
brown=$(tput setaf 237)
bold=$(tput bold)

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"31;01m"

reset=$(tput sgr0)

# format definitions
filename_format="$normal"
dirname_format="$reset$blue$bold"
file_numbers_format="$brown"


# # zebra definitions and format
# zebra_on_color=$(tput setab 237)
# zebra_off_color=$black_bg
# zebra=$()
# zebra_on=0

i=1

for f in $FILES; do
  printf "$reset"

  # file numbers
  printf "$file_numbers_format"
  #printf "%${space_for_file_numbers}d | " "$i"
  printf " |"

  # # zebra calculation
  # if [ $zebra_on -eq 1 ]; then
  #   zebra=$zebra_on_color
  #   zebra_on=0
  # else
  #   zebra=$zebra_off_color
  #   zebra_on=1
  # fi


  str=$(git log -1 --pretty=format:"%<(23)%C(green)%cr%C(white) | %C(cyan)%h%C(white) | %<(15)%C(yellow)%cn%C(white) | %s" $f)
  if [ -d "$f" ]; then
    printf "$dirname_format"
  else
    printf "$filename_format"
  fi

  if [ -d "$f" ]; then
    f="$f/"
  fi

  printf "%-${MAXLEN}s$reset" "$f"

  printf " -- %s\n" "$str"
  i=$((i + 1))
done

printf "$(tput sgr 0)"
