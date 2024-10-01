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
    gnome-contacts
    gnome-calendar
    gnome-maps
    gnome-music
    gnome-shell-extensions
    geary
    totem
    yelp
  ];

  environment.systemPackages = with pkgs; [
#     gnome.gnome-tweaks
#     gnomeExtensions.dash-to-dock
#     gnomeExtensions.xwayland-indicator
    gnomeExtensions.dash-to-panel
  ];

  programs.dconf.enable = true;

  programs.dconf = {
    profiles.users.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/shell" = {
            disable-user-extensions = false;

            enabled-extensions = [
#               "appindicatorsupport@rgcjonas.gmail.com"
#               "dash-to-dock@micxgx.gmail.com"
#               pkgs.gnomeExtensions.dash-to-dock
#               "user-theme@gnome-shell-extensions.gcampax.github.com"
              "dash-to-panel@jderose9.github.com"
            ];
          };
        };
      }
    ];
  };

}
