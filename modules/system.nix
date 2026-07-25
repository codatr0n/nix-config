{ config, pkgs, lib, username, ... }:

{

  #########################################
  # User related
  #########################################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.funk = {
    isNormalUser = true;
    description = "Funk";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
      "libvirtd"
      "video"
      "render"
      "audio"
      "dialout"
    ];
  };

  home-manager.backupFileExtension = "backup";

  #########################################
  # System related
  #########################################

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;

    # Binary caches for faster downloads
    substituters = [
      "https://cache.nixos.org"  # Default cache
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    # Performance optimizations
    http-connections = 128;
    max-jobs = "auto";
    download-buffer-size = 134217728; # 128 MB (default is 64 MB)

  };

  # nix garbage collect
  nix.gc = {
    automatic = true;
    dates = "03:00";
    persistent = false;
    options = "--delete-older-than 60d";
  };

  # keep KDE processes in RAM instead of swapping under memory pressure
  boot.kernel.sysctl."vm.swappiness" = 10;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";


  #########################################
  # List services that you want to enable:
  #########################################


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Tailscale
  services.tailscale.enable = true;

  # Firmware Update
  services.fwupd.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Udisk - auto mount usb drives
  services.udisks2.enable = true;

  # Disable ModemManager (no modem on this hardware)
  systemd.services.ModemManager.enable = false;



}
