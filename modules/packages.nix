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
    joplin-desktop

    # kde apps
    kdePackages.kate
    kdePackages.konsole
    kdiskmark

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
    dmidecode # show bios stuff
    usbutils # usb utilities like lsusb
    ncdu
    lm_sensors
    hdparm
    lsof
    iotop


    # developer stuff
    python311
    gh
    uv

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

    # wifi
    iwd
    pciutils

    # misc
    rpi-imager # raspberry pi imager

    # filesystems
    hfsprogs
    exfatprogs
    testdisk
    testdisk-qt

    # image tools
    exiftool
    jhead
    imagemagick


  ];

  # workaround to allow build with ventoy
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.05"
  ];

}
