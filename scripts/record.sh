#!/bin/bash

filename="$HOME/screencasts/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

geometry=$(slurp)

if [ $? -ne 0 ] || [ -z "$geometry" ]; then
    notify-send "Screen Recording" "Recording canceled"
    exit 1
fi

notify-send "Screen Recording" "🔴 Recording started at $(date '+%H:%M:%S')"

wf-recorder -g "$geometry" -f "$filename"

notify-send "Screen Recording" "✅ Recording saved to: $(basename "$filename")"

