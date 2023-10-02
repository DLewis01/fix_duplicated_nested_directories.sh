#!/bin/sh


echo "This program will remove nested directories (usually occurs after a bulk unzip)."
echo "./mydir/mydir/files.* will become just ./mydir/files.*"
echo "run this from the parent directory that you can see mydir in"

read -n 1 -s -r -p "Press any key to continue, ctrl C to exit"


find ./ -type d -path '*/[^/]*/[^/]*' -exec bash -c 'dir="{}"; base=$(basename "$dir"); parent=$(basename "$(dirname "$dir")"); if [ "$base" = "$parent" ]; then mv -n "$dir"/* "$(dirname "$dir")/"; fi' \;
