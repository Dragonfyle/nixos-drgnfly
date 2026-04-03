set -g fish_key_bindings fish_vi_key_bindings
set -g fish_greeting ''
bind -M insert \cg clear-screen
bind -M insert \cl forward-word
bind -M insert \cp up-or-search
bind -M insert \cn down-or-search
bind -M insert --sets-mode default \cj repaint
bind -M insert \es __fish_prepend_sudo
bind -M insert alt-o "$EDITOR"
set -g fish_color_autosuggestion "#955239"

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

# colored man output
# Solarized Dark & Green highlight
set -g man_blink (set_color -o brred)
set -g man_bold (set_color -o brgreen)
set -g man_standout (set_color -b blue white)
set -g man_underline (set_color -u cyan)

# Autojump
if test -f /usr/share/autojump/autojump.fish
    source /usr/share/autojump/autojump.fish
end

# Sources
if test -f /usr/share/wikiman/widgets/widget.fish
    source /usr/share/wikiman/widgets/widget.fish
    # rebinds default ^k in the widget
    bind \ck _wikiman_widget
    bind -M insert \ck _wikiman_widget
end
bind -M insert \cf accept-autosuggestion

if command -q nvim
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR nvim
    set -gx VISUAL nvim
else
    set -gx EDITOR vim
    set -gx SUDO_EDITOR vim
    set -gx VISUAL vim
end

set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --no-ignore'

# removes the timestamp on the far right of a command
function fish_right_prompt
    # Leave this empty to remove the right prompt completely
end

