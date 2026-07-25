{ config, pkgs, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  environment.systemPackages = with pkgs; [
    kdePackages.kio-extras              # network:/ support in Dolphin
    kdePackages.kdenetwork-filesharing  # KDE network sharing tools
  ];

}
