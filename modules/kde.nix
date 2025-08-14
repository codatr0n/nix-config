{ config, pkgs, ... }:
{


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager # for KDE Partition Manager
    kdePackages.kio-extras              # network:/ support in Dolphin
    kdePackages.kdenetwork-filesharing  # KDE network sharing tools
  ];


  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];

  # exclude individual kde pacakges/apps
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
#     plasma-browser-integration
#     konsole
#     oxygen
  ];

  programs.dconf.enable = true;

  programs.partition-manager.enable = true; # KDE Partition Manager

}
