# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;
  };


  imports =
    [
      ./keyboard.nix
      ./sound.nix
      ./packages.nix
      ./fonts.nix
      ./zsh.nix
      ./gnome.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Enable auto optimising the store - funk 2024.09.18
  nix.settings.auto-optimise-store = true;

  # nix garbage collect
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  # disable passwords
  security = {
    sudo.wheelNeedsPassword = false;
  };

  # qemu guest agent
  services.qemuGuest.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

    # add zsh shell
  environment.shells = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "ls" = "eza -alh --group-directories-first --time-style=long-iso --icons --git";
      "nrs" = "sudo nixos-rebuild switch";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.funk = {
    isNormalUser = true;
    description = "Funk";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [

      # GNOME
      # gnomeExtensions.shell-configurator
      # gnomeExtensions.dash-to-dock
      # gnome.gnome-shell-extensions
      # gnomeExtensions.wifi-switcher
     
    ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # auto upgrades - funk 2024.09.18
  system.autoUpgrade = {
    enable = true;
    channel = "https://channels.nixos.org/nixos-24.05";
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Tailscale
  services.tailscale.enable = true;

  # Firmware Update
  services.fwupd.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";


}
