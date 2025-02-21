#!/bin/bash

# Check if arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <screen_name> <start_number> <end_number>"
    echo "Example: $0 nexus-main 20 30"
    exit 1
fi

SCREEN_NAME=$1
START_NUM=$2
END_NUM=$3

# Validate numbers
if ! [[ "$START_NUM" =~ ^[0-9]+$ ]] || ! [[ "$END_NUM" =~ ^[0-9]+$ ]]; then
    echo "Error: Start and end numbers must be positive numbers"
    exit 1
fi

if [ "$START_NUM" -gt "$END_NUM" ]; then
    echo "Error: Start number must be less than or equal to end number"
    exit 1
fi

# Delete screens with given name from start to end number
for i in $(seq $START_NUM $END_NUM)
do
    SCREEN_ID=$(screen -list | grep "${SCREEN_NAME}${i}" | cut -f1 -d'.' | tr -d '\t ')
    
    if [ ! -z "$SCREEN_ID" ]; then
        # Kill the screen session
        screen -X -S "$SCREEN_ID" quit
        echo "Screen deleted: ${SCREEN_NAME}${i}"
    else
        echo "Screen not found: ${SCREEN_NAME}${i}"
    fi
done

# Display remaining screens
echo -e "\nRemaining running screens:"
screen -list 