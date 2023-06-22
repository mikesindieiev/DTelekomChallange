#!/bin/bash
set -x
if [ $1 ]; then
  ip=$1
else 
  echo 'Please provide an IP address or range to scan as a command-line argument'
  exit 1
fi
nmap --open "$ip" -oG latest.txt

# Remove the first and last line in the file with unnecessary info
seq 9 | sed -i -e '1d
$ d
/Status: Up/d
s/Ignored.*//
s/,/ /g
s/Host:/ /
s/Ports:/ /
s/^[[:space:]]*//
s/\t/ /g' latest.txt

cat latest.txt

#cp latest.txt prev.txt
