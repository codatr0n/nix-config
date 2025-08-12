{ config, pkgs, username, pkgs-unstable, ... }:

{

  environment.systemPackages = [
    pkgs-unstable.warp-terminal
  ];

}
