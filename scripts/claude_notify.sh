#!/bin/bash

CLAUDE_TMUX_PANE="$TMUX_PANE"
CLAUDE_TMUX_WINDOW=$(tmux display-message -t "$CLAUDE_TMUX_PANE" -p '#{window_id}')
TERMINAL_CLASS="Alacritty"

ACTIVE_PANE=$(tmux list-panes -F '#{pane_active} #{pane_id}' | grep '^1 ' | awk '{print $2}')

ACTIVE_WINDOW_CLASS=$(hyprctl activewindow | grep "^	class:" | awk '{print $2}')

if [ "$ACTIVE_WINDOW_CLASS" != "$TERMINAL_CLASS" ] || \
   ([ "$ACTIVE_PANE" != "$CLAUDE_TMUX_PANE" ]); then
    tmux set-option -wt "$CLAUDE_TMUX_WINDOW" @claude_waiting 1
    notify-send 'Claude Code' 'Awaiting input'
    paplay /usr/share/sounds/freedesktop/stereo/message.oga
fi
