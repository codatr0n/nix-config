{ config, pkgs, username, ... }:

{

  environment.systemPackages = with pkgs; [
    warp-terminal
  ];

}
