{ config, pkgs, stateVersion, ... }:

{

  imports =
    [
      ../../modules/system.nix
      ../../modules/keyboard.nix
      ../../modules/sound.nix
      ../../modules/packages.nix
      ../../modules/fonts.nix
      ../../modules/zsh.nix
      ../../modules/networking.nix
      ../../modules/kde.nix

      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "thinknix-t460";

  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd.enable = true;
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  environment.shells = with pkgs; [ zsh ];

  system.stateVersion = "${stateVersion}";

}
