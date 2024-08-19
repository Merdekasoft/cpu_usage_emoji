#!/bin/bash

# Get the CPU usage percentage using 'mpstat' (from sysstat package)
cpu_usage=$(mpstat 1 1 | awk '/Average/ {printf "%d", 100 - $12}')

# Choose the appropriate emoji based on CPU usage
if [ "$cpu_usage" -lt 20 ]; then
    emoji="😄"  # Low CPU usage, happy
elif [ "$cpu_usage" -lt 70 ]; then
    emoji="🙂"  # Medium CPU usage, neutral
else
    emoji="😡"  # High CPU usage, angry
fi

# Print the emoji followed by the CPU usage percentage
echo "$emoji $cpu_usage%"
