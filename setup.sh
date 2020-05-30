#!/bin/bash -eu

function spin() {
    spinner="/|\\-/|\\-"
    while :
    do
        for i in `seq 0 7`
        do
            echo -n "${spinner:$i:1}"
            echo -en "\010"
            sleep 0.1
        done
    done
}

function run() {
    echo -n "${1} ................... "

    spin &
    SPIN_PID=$!
    trap "kill -9 $SPIN_PID" `seq 0 15`

    . ./${1}.sh 1>/dev/null

    echo "Done (${?})"
    kill -9 $SPIN_PID
}

run test-include
run test-include

