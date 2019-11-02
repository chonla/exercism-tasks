#!/usr/bin/env bash

main() {
    buff=()
    if (( $1 % 3 == 0 || $1 % 5 == 0 || $1 % 7 ==0 )); then
        if (( $1 % 3 == 0 )); then
            buff+=('Pling')
        fi
        if (( $1 % 5 == 0 )); then
            buff+=('Plang')
        fi
        if (( $1 % 7 == 0 )); then
            buff+=('Plong')
        fi
    else
        buff+=($1)
    fi
    out=$(IFS= ; echo "${buff[*]}")
    echo "$out"
}

main "$@"