#!/usr/bin/env bash

main() {
    if (( $1 % 3 != 0 && $1 % 5 != 0 && $1 % 7 != 0 )); then
        echo $1
        exit 0
    fi
    
    if (( $1 % 3 == 0 )); then
        printf "Pling"
    fi
    if (( $1 % 5 == 0 )); then
        printf "Plang"
    fi
    if (( $1 % 7 == 0 )); then
        printf "Plong"
    fi
    echo ""
}

main "$@"