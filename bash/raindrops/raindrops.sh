#!/usr/bin/env bash

main() {
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
    if [ "$accu" == "" ]; then
        accu=$1
    fi
    echo $accu
}

main "$@"