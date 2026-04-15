{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_greeting ""
      bind -M insert \cg clear-screen
      bind -M insert \cl forward-word
      bind -M insert \cp up-or-search
      bind -M insert \cn down-or-search
      bind -M insert --sets-mode default \cj repaint
      bind -M insert \es __fish_prepend_sudo
      bind -M insert alt-o "$EDITOR"
      set -g fish_color_autosuggestion "#955239"

      set __fish_git_prompt_showuntrackedfiles yes
      set __fish_git_prompt_showdirtystate yes
      set __fish_git_prompt_showstashstate ""
      set __fish_git_prompt_showupstream none
      set -g fish_prompt_pwd_dir_length 3

      set -g man_blink (set_color -o brred)
      set -g man_bold (set_color -o brgreen)
      set -g man_standout (set_color -b blue white)
      set -g man_underline (set_color -u cyan)

      if test -f /usr/share/wikiman/widgets/widget.fish
          source /usr/share/wikiman/widgets/widget.fish
          bind \ck _wikiman_widget
          bind -M insert \ck _wikiman_widget
      end

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
    '';

    functions = {
      fish_right_prompt = "";
    };
  };

  xdg.configFile = {
    "fish/conf.d/abbr.fish".source                    = ../dotfiles/fish/conf.d/abbr.fish;
    "fish/conf.d/autorunrc.fish".source               = ../dotfiles/fish/conf.d/autorunrc.fish;
    "fish/conf.d/fish_frozen_key_bindings.fish".source = ../dotfiles/fish/conf.d/fish_frozen_key_bindings.fish;
    "fish/conf.d/fish_frozen_theme.fish".source       = ../dotfiles/fish/conf.d/fish_frozen_theme.fish;
    "fish/conf.d/functions.fish".source               = ../dotfiles/fish/conf.d/functions.fish;
    "fish/conf.d/gitrc.fish".source                   = ../dotfiles/fish/conf.d/gitrc.fish;
    "fish/conf.d/utils.fish".source                   = ../dotfiles/fish/conf.d/utils.fish;
    "fish/functions/__fish_prepend_sudo.fish".source  = ../dotfiles/fish/functions/__fish_prepend_sudo.fish;
    "fish/functions/fish_prompt.fish".source          = ../dotfiles/fish/functions/fish_prompt.fish;
    "fish/functions/fish_user_key_bindings.fish".source = ../dotfiles/fish/functions/fish_user_key_bindings.fish;
    "fish/completions/alacritty.fish".source          = ../dotfiles/fish/completions/alacritty.fish;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.keychain = {
    enable = true;
    enableFishIntegration = true;
    keys = [
      "gh_yubikey_usb_a_resident"
      "gh_yubikey_usb_c_resident"
    ];
  };

  programs.autojump.enable = true;

  home.sessionPath = [
    "$HOME/scripts"
    "$HOME/.local/bin"
  ];
}
