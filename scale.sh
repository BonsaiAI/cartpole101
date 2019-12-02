#!/bin/bash
set -o errexit			# quit on any error
set -o pipefail			# quit if a program in a pipeline throws an error
set -o nounset			# stop if an unassigned variable is used

# https://spin.atomicobject.com/2017/08/24/start-stop-bash-background-process/

usage() {
cat << EOF
scale [number_of_sims_to_run=16]
EOF
}

handler() {
	echo "Cleaning up $(jobs -p | tr '\n' ' ')"
	kill 0
}

trap "handler" EXIT

JOBS=${1:-16}

for i in $(seq 1 $JOBS); do
	python sim.py &
done

wait $(jobs -p)
