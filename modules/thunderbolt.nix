{ config, pkgs, ... }:

{
  # Thunderbolt

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-thunderbolt  # Plasma integration for controlling Thunderbolt devices
    thunderbolt                     # Thunderbolt(TM) user-space components
    bolt                            # Thunderbolt 3 device management daemon
  ];

  services.hardware.bolt.enable = false; # Bolt is used by GNOME 3 to handle Thunderbolt settings.

}
