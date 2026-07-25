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

    # desktop apps
    bitwarden-desktop
    trayscale
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
    python3
    gh
    nodejs
    bun

    # printing
    gutenprint
    hplip

    # terminal tools
    eza
    bat
    fastfetch
    ventoy
    yt-dlp
    mesa-demos
    imagemagick

    # vs code server
    code-server

    # torrents
    kdePackages.ktorrent
    qbittorrent

    # wifi
    iwd
    pciutils

    # file syncthing
    jotta-cli
    stc-cli

    udiskie  # Auto mount usb drives
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
    };

    btop.enable = true;
    eza.enable = true;
    jq.enable = true;
    ssh.enable = true;
  };

  services = {
    syncthing.enable = true;
    udiskie = {
      enable = true;
    };

  };
}
