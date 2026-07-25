{ config, pkgs, ... }:
{
  # Enable Avahi for network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Basic network utilities for SMB/CIFS mounting
  environment.systemPackages = with pkgs; [
    cifs-utils              # SMB/CIFS mounting utilities
  ];
}
