#!/bin/bash

# Get the CPU usage percentage using 'mpstat' (from sysstat package)
cpu_usage=$(mpstat 1 1 | awk '/Average/ {printf "%d", 100 - $12}')

# Choose the appropriate emoji based on CPU usage
if [ "$cpu_usage" -lt 10 ]; then
    emoji="😄"  # Very low CPU usage, happy
elif [ "$cpu_usage" -lt 30 ]; then
    emoji="😊"  # Low CPU usage, smiling
elif [ "$cpu_usage" -lt 50 ]; then
    emoji="🙂"  # Medium CPU usage, neutral
elif [ "$cpu_usage" -lt 70 ]; then
    emoji="😐"  # Slightly high CPU usage, meh
elif [ "$cpu_usage" -lt 90 ]; then
    emoji="😟"  # High CPU usage, worried
else
    emoji="😡"  # Very high CPU usage, angry
fi

# Print the emoji followed by the CPU usage percentage
echo "$emoji $cpu_usage%"
