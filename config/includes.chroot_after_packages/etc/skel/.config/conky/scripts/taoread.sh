#!/bin/sh
# a script for outputting a verse of the Tao Te Ching.
# by rhowaldt
#tao=$HOME/bin/tao.txt
tao=$HOME/.config/conky/scripts/tao.txt
verse=0
# you can chose between /dev/random which is slow but provides ``more random''
# numbers than the faster /dev/urandom
dev_rand=/dev/urandom
#dev_rand=/dev/random

# if we have no arguments we pick a random verse
if [ $# -eq 0 ]; then
  # find a random number between 1 and 81 and save it to verse
  while [ $verse -lt 1 ] || [ $verse -gt 81 ]; do
    # take one byte (-n1) from /dev/[u]random and save its decimal value to verse (-e '"%1d"') (see "man hexdump")
    verse=`hexdump -e '"%1d"' -n1 $dev_rand`
  done
# if we have exactly one argument we pick that verse
elif [ $# -eq 1 ]; then
  # the verse must be a number between 1 and 81
  if [ $1 -ge 1 ] && [ $1 -le 81 ]; then
    verse=$1
  else
    echo "The Tao Te Ching only has 81 verses." >&2
    echo "If you require even more wisdom, sit down and think of nothing." >&2
    exit 1
  fi
# we got the wrong number of arguments
else
  echo "Too many arguments." >&2
  echo "Use 'tao' for a random verse, or 'tao [1-81]' for a specific verse." >&2
  exit 1
fi

stop=$(($verse+1))
# look into the text file and search for the verse number
sed -n -e '/^---'$verse'---$/,${/^---'$stop'---$/q;p;}' $tao
