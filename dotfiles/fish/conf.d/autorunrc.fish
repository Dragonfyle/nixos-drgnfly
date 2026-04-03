# run keychain
if status is-interactive
    and command -q keychain
    keychain --quiet -Q gh_yubikey_usb_a_resident gh_yubikey_usb_c_resident
    source ~/.keychain/(cat /etc/hostname)-fish
end

# run tmux if not running
if status is-interactive
    and not set -q TMUX
    and set -q HYPRLAND_INSTANCE_SIGNATURE
    tmux
end

if status is-interactive
    and not set -q TMUX_SESSION_INITIALIZED

    # setup PATH
    set -gx PATH $HOME/scripts/ $PATH
    set -gx PATH $HOME/.local/bin $PATH
    set -gx PATH $HOME/.claude/local $PATH

    set -gx TMUX_SESSION_INITIALIZED true
end
