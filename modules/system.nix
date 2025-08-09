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

    # Enable auto optimising the store - funk 2024.09.18
    auto-optimise-store = true;
  };

  # nix garbage collect
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };


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

}
