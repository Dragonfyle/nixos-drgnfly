#!/usr/bin/env bash

STEP=5
DIRECTION="$1"
NOTIFY_ID=9999

HAS_EXTERNAL=$(hyprctl monitors -j | jq '[.[] | select(.name | startswith("eDP") | not)] | length')

if [[ "$HAS_EXTERNAL" -gt 0 ]]; then
    if [[ "$DIRECTION" == "up" ]]; then
        ddcutil setvcp 10 + "$STEP"
    else
        ddcutil setvcp 10 - "$STEP"
    fi

    CURRENT=$(ddcutil getvcp 10 | grep -oP 'current value =\s*\K\d+')
else
    if [[ "$DIRECTION" == "up" ]]; then
        brightnessctl -e4 -n2 set 5%+
    else
        brightnessctl -e4 -n2 set 5%-
    fi

    CURRENT=$(brightnessctl -m | cut -d, -f4 | tr -d %)
fi

dunstify -a "brightness" -r "$NOTIFY_ID" -h "int:value:$CURRENT" -i "" -u low "Brightness" "${CURRENT}%"
