{ config, pkgs, username, ... }:

{
  # Syncthing

  environment.systemPackages = with pkgs; [
    syncthingtray
    stc-cli
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "${username}";
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";
    group = "users";
    guiAddress = "0.0.0.0:8384";

  };

}
