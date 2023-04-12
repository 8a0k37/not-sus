#!/bin/bash


source=/.pp_essential/pp_config.conf

versionpp="$version"
if [[ "$versionpp" == "1.0" ]]; then
  sleep 0.1
else
  echo "ERROR: version check error."
  echo "CHECK CONFIG FOR VERSION OR"
  echo "OR RE-SETUP NOW. (sudo pp --resetup)"
fi
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

function resetup
{
  echo "Resetup failed, is your version correct?"
  echo "WARNING: RESETUP ONLY WORKS ON CERTAIN OS."
  echo "WARNING: YOU SHOULD REINSTALL INSTEAD!"
  echo "/-> fatal error."
  echo "/-> reinstall now."
  echo 
}

if [[ "$1" == "-l" ]]; then
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
elif [[ "$1" == "--help" ]]; then
  echo "HELP:"
  echo "All operators and their use:"
  echo "'-l (length)' - Set the pp length"
  echo "'-w (width)' - Set the pp width"
  echo "'--help' - Show this page"
  echo "'--resetup' - Resetup pp"
  echo "'--version' - Show pp version"
  echo "'--config' - Edit config (using nano)"
  echo "/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/"
elif [[ "$1" == "--resetup" ]]; then
  resetup
elif [[ "$1" == "--version" ]]; then
  echo "pp version: ${versionpp}"
elif [[ "$1" == "--config" ]]; then
  echo "Opening pp config..."
  sleep 2
  nano /.pp_essential/pp_config.conf
else
  echo "Use pp format: 'pp -l (length)'"
  echo "(length = number of characters)"
fi
exit 1
