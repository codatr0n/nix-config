{ config, pkgs, lib, ... }:

let
  vars = import ./vars.nix;
in

{

  environment.systemPackages = with pkgs; [
    syncthing
    syncthingtray
  ];

  services.syncthing = {
    enable = true;
    systemService = true;
    openDefaultPorts = true;
    user = vars.user;
    dataDir = "/home/${vars.user}/syncthing";
    configDir = "/home/${vars.user}/.config/syncthing";
#     settings = {
#       gui = {
#         user = vars.user;
#       };
#     };
  };

}
