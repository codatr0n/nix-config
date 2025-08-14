{ config, pkgs, ... }:
{
  # Enable Avahi for network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable Samba for SMB/CIFS shares (Unraid, ZimaOS, OMV)
  services.samba = {
    enable = true;
    openFirewall = true;
    nsswins = true;  # NetBIOS name resolution
  };

  # Network discovery firewall ports
  networking.firewall = {
    allowedTCPPorts = [ 139 445 ];  # SMB/CIFS
    allowedUDPPorts = [ 137 138 ];  # NetBIOS
  };

  # Basic network utilities for SMB/CIFS mounting
  environment.systemPackages = with pkgs; [
    cifs-utils              # SMB/CIFS mounting utilities
  ];
}
