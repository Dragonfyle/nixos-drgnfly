#!/usr/bin/env bash

LOG="$HOME/.cache/hyprland-monitor-switch.log"
EXTERNAL_MONITOR="HDMI-A-1"
INTERNAL_MONITOR="eDP-1"
INTERNAL_RES="1920x1080@144"

log() {
    echo "[$(date '+%H:%M:%S')] $*" >> "$LOG"
}

disable_internal() {
    log "disabling internal"
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable" >> "$LOG" 2>&1
}

enable_internal() {
    log "enabling internal"
    hyprctl keyword monitor "$INTERNAL_MONITOR,$INTERNAL_RES,auto,1" >> "$LOG" 2>&1
}

apply_initial_state() {
    if hyprctl -j monitors all | jq -e ".[] | select(.name == \"$EXTERNAL_MONITOR\")" > /dev/null 2>&1; then
        log "initial: external connected, disabling internal"
        disable_internal
    else
        log "initial: external not connected, enabling internal"
        enable_internal
    fi
}

log "started (PID=$$)"
sleep 2
apply_initial_state

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
log "connecting to socket: $SOCKET"

socat -u "UNIX-CONNECT:$SOCKET" - 2>> "$LOG" | while IFS= read -r event; do
    event="${event%$'\r'}"
    log "event: $event"
    case "$event" in
        "monitoradded>>$EXTERNAL_MONITOR")
            disable_internal
            ;;
        "monitorremoved>>$EXTERNAL_MONITOR")
            enable_internal
            ;;
    esac
done

log "event loop exited"
