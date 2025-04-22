#!/usr/bin/env bash

expr='^([aeiou]|xr|yt)'
suf="ay"

pl() {
    if [[ "$1" =~ $expr ]]; then
      echo "${1}" ; return
    fi
    
    for (( i=0; i<${#1}; i++ )); do
      head=${1:i}
      if [[ "$head" =~ ^(qu) ]]; then
        echo "${1:i+2}${1:0:i+2}" ; return
      elif [[ "$head" =~ ^[aeiou] || ("$head" =~ ^y && "$i" -ne 0) ]]; then
        echo "${head}${1:0:i}" ; return
      fi
    done
}

result=()
for word in "$@"; do
  processed=$(pl "$word")
  result+=("$processed${suf}") 
done

echo "${result[*]}"