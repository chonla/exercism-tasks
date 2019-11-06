#!/usr/bin/env bash

main() {
    if (( $1 % 3 != 0 && $1 % 5 != 0 && $1 % 7 != 0 )); then
        echo $1
        exit 0
    fi
    
    accu=""
    if (( $1 % 3 == 0 )); then
        accu+="Pling"
    fi
    if (( $1 % 5 == 0 )); then
        accu+="Plang"
    fi
    if (( $1 % 7 == 0 )); then
        accu+="Plong"
    fi
    echo "$accu"
}

main "$@"