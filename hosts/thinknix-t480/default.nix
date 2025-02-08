# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, stateVersion, ... }:

{

  imports =
    [

      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../modules/thunderbolt.nix
      ../../modules/bluetooth.nix

      ../../modules/system.nix
      ../../modules/keyboard.nix
      ../../modules/sound.nix
      ../../modules/packages.nix
      ../../modules/fonts.nix
      ../../modules/zsh.nix
#       ../../modules/gnome.nix
      ../../modules/kde.nix


    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "thinknix-t480"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
#   networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd.enable = true;
  };

  # disable passwords
  security = {
    sudo.wheelNeedsPassword = false;
  };

  # qemu guest agent
  # services.qemuGuest.enable = true;

  # add zsh shell
  environment.shells = with pkgs; [ zsh ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "${stateVersion}";


}
