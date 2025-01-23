{ config, pkgs, stdenv, lib, ... }:

{

  dconf.enable = true;

  qt = {
    enable = true;
    style.name = "breeze";
  };

  home.packages = with pkgs; [

    # KDE apps
    kdePackages.kdeconnect-kde    # KDE connect
    kdePackages.ark               # File archiver by KDE
    kdePackages.qxlsx             # Excel file(*.xlsx) reader/writer library using Qt 5 or 6
    kdePackages.qt6ct             # Qt6 Configuration Tool
    kdePackages.kalk              # Kalk is a powerful cross-platform calculator applicatio
    kdePackages.kcalc             # calculator
    kdePackages.partitionmanager  # partitionmanager
    kdePackages.filelight
    kdePackages.kcolorchooser
    kdePackages.kcolorpicker
    kdePackages.kfind
    kdePackages.isoimagewriter
    kdePackages.plasma-disks
    kdePackages.kweather

    kdePackages.dolphin-plugins


    tailscale-systray

  ];

}
