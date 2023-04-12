#!/bin/bash


source=/.pp_essential/pp_config.conf

startpp="$start"
endpp="$end"
ucm=$use_custom_middle

if [[ $use_custom_middle = 1 ]]; then
  cmiddle="$custom_middle"
else
  cmiddle="="
fi

max_length=$max_pp_length
max_width=$max_pp_width

length=0
a_length=""

if [[ "$1" == "-l"* ]]; then
  if [[ $length -gt $max_length ]]; then
    echo "The maximum pp length"
    echo "has been exceeded."
    echo "(Max: ${max_length}; Your: ${length})"
    echo "To fix this, please change the maximum"
    echo "length in the 'pp_config.conf' file."
    echo "(/.pp_essential/pp_config.conf)
  else
    for (( i=1; i<=$2; i++ ))
    do
      a_length+="$cmiddle"
    done
    echo "${startpp}${a_length}${endpp}"
else
  echo "Use pp format: 'pp -l (length)'"
  echo "(length = number of characters)"
fi
exit 1
