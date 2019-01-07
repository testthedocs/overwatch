#!/bin/bash

# curl -s https://api.github.com/repos/testthedocs/redactor/releases | egrep '"name"|"download_count"'

echo "Redactor"
curl -s https://api.github.com/repos/testthedocs/redactor/releases | egrep 'download_count'  | cut '-d:' -f 2 | sed 's/,/+/' | xargs echo | xargs -I N echo N 0  | bc

echo "Edic"
curl -s https://api.github.com/repos/testthedocs/edic/releases | egrep 'download_count'  | cut '-d:' -f 2 | sed 's/,/+/' | xargs echo | xargs -I N echo N 0  | bc

echo "Henry"
curl -s https://api.github.com/repos/testthedocs/henry/releases | egrep 'download_count'  | cut '-d:' -f 2 | sed 's/,/+/' | xargs echo | xargs -I N echo N 0  | bc
