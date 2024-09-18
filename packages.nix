{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [

    # desktop apps
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

    # kde apps
    kdePackages.kate
    kdePackages.konsole

    # common
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
    unzip
    tree
    nmap
    lshw

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

  ];

}
