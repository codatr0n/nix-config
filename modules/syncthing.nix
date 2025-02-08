{ config, pkgs, ... }:

{
  # Syncthing

  environment.systemPackages = with pkgs; [
    syncthingtray
    stc-cli
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";

  };

}
