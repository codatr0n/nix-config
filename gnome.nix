{ config, pkgs, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  # services.gnome.core-utilities.enable = false; # disable built-in gnome apps
  # exclude individual gnome apps
  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    gnome-calendar
    gnome-maps
    gnome-music
    geary
    totem
    yelp
  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];

}
