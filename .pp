#!/bin/bash
length=0

a_length=""

if [[ "$1" == "-l"* ]]; then

  for (( i=1; i<=$2; i++ ))

  do

    a_length+="="

  done
  echo "8${a_length}D"
else

  echo 'Please select the length using -l (size>

  echo '(one cm = one char)'

fi
