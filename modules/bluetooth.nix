{ config, pkgs, ... }:

{
  # Bluetooth
  # additional configuration might be needed for BT audio - see: https://nixos.wiki/wiki/Bluetooth

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
    settings = {
      General = {
		Experimental = false; # might show battery charge of BT device
      };
    };
  };

  services.blueman.enable = false; # blueman provides a bluetooth interface if not supplied by desktop environment


}
