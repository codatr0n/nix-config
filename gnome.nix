{ config, pkgs, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # exclude individual gnome apps
  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    gnome-contacts
    gnome-calendar
    gnome-maps
    gnome-music
    gnome-shell-extensions
    geary
    totem
    yelp
  ];

  programs.dconf.enable = true;

}
