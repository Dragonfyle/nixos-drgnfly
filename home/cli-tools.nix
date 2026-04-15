{ pkgs, ... }:

{
  xdg.configFile."btop/btop.conf".source = ../dotfiles/btop/btop.conf;

  home.packages = with pkgs; [
    bat
    eza
    fd
    ripgrep
    fzf
    jq
    btop
    htop
    powertop
    broot
    tealdeer
    glow
    plocate
    brightnessctl
    ddcutil
    hyperfine
    lsof
    unzip
    unrar
    p7zip

    nmap
    wireshark-cli
    termshark
    socat
    netcat-openbsd
    dig
    rclone
    wget
    curl
    whois
    macchanger

    feh
    grim
    slurp
    wf-recorder
    playerctl
    pavucontrol
    imagemagick

    firefox
    vivaldi
    libreoffice-fresh

    bpftrace
    valgrind
    man-db
	claude-code
  ];
}
