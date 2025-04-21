{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip
    unrar
    arj

    # utils
    ripgrep
    tldr
    curl
    wget
    fwupd
    git
    tmux
    htop
    btop
    gtop
    iperf3
    ipmitool
    tree
    nmap
    lshw
    dmidecode

    # desktop
    bitwarden-desktop
    librewolf
    trayscale
    firefox
    google-chrome
    spotify
    alacritty
    krita
    rustdesk-flutter
    angryipscanner
    distrobox
    vlc
    joplin-desktop

    # developer stuff
    python311
    gh

    # printing
    gutenprint
    hplip

    # terminal tools
    eza
    bat
    fastfetch
    ventoy
    yt-dlp
    glxinfo

    # vs code server
    code-server

    # torrents
    kdePackages.ktorrent
    qbittorrent

    # wifi
    iwd
    pciutils

    udiskie  # Auto mount usb drives
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      # keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
  };

  services = {
    syncthing.enable = true;
  };
}
