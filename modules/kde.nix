{ config, pkgs, ... }:
{


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # exclude individual kde pacakges/apps
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
#     plasma-browser-integration
#     konsole
#     oxygen
  ];

  programs.dconf.enable = true;

}
