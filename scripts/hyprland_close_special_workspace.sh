#!/bin/bash

# Get the name of the active special workspace
SPECIAL_WORKSPACE_NAME=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name')

# If a special workspace is active (name is not null or empty)
if [[ -n "$SPECIAL_WORKSPACE_NAME" && "$SPECIAL_WORKSPACE_NAME" != "null" ]]; then
    # Extract the name part after "special:"
    CLEAN_NAME=$(echo "$SPECIAL_WORKSPACE_NAME" | sed 's/special://')
    # Close the special workspace
    hyprctl dispatch togglespecialworkspace "$CLEAN_NAME"
fi
