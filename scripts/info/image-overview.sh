#!/bin/sh
# Usage: image-overview.sh > output.html

docker images | awk '
BEGIN {print ("<table>")};
/REPOSITORY/{
print("<tr><th>" $1,"</th><th>" $2,"</th><th>" $3,$4,"</th><th>" $5"</th><th>" $6"</th></tr>")}
/MB/{
print ("<tr><td>" $1,"</td><td>" $2,"</td><td>" $3,"</td><td>" $4,$5,$6 "</td><td> " $7,$8 "</td></tr>")}
END {print ("</table>")}'