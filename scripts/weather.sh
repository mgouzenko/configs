#!/bin/bash
curl -s wttr.in | sed -n '3,7{s/\d27\[[0-9;]*m//g;s/^..//;s/ *$//;p}' | sed -e 's/^/┃ /'
# while read LINE; do
#     printf "┃%s\n" "$LINE"
# done < /tmp/weather.txt
