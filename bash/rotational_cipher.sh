#!/usr/bin/env bash

str="$1"
ans=""
for (( i=0; i<${#str}; i++ )); do
    ch="${str:$i:1}"
    new_char="$ch"
    if [[ "$ch" =~ [a-z] ]]; then
        index=$(( $(printf '%d' "'$ch") - 97 ))
        mod=$(( (index + $2) % 26 ))
        new_char=$(printf \\$(printf '%03o' $((mod + 97))))
    elif [[ "$ch" =~ [A-Z] ]]; then
        index=$(( $(printf '%d' "'$ch") - 65 ))
        mod=$(( (index + $2) % 26 ))
        new_char=$(printf \\$(printf '%03o' $((mod + 65))))
    fi
    ans="${ans}${new_char}"
done

echo "$ans"