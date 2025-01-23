{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    htop
    tldr

  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      # keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
