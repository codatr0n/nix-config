{ config, pkgs, ... }:

{
  # Thunderbolt
  # to enroll/autorize thundebolt devices run this in the terminal:
  # boltctl enroll --chain 00616104-5c7b-d400-ffff-ffffffffffff

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-thunderbolt  # Plasma integration for controlling Thunderbolt devices
    thunderbolt                     # Thunderbolt(TM) user-space components
    bolt                            # Thunderbolt 3 device management daemon
  ];

  services.hardware.bolt.enable = true; # Bolt is used by GNOME 3 to handle Thunderbolt settings.

}
