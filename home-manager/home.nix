{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "funk";
  home.homeDirectory = "/home/funk";

  home.stateVersion = "24.05";

  # Allow unfree packages
  nixpkgs.config.allowUnfreePredicate = true;

  # IMPORTS
  imports = [
    ./apps/zsh.nix
    ./apps/starsip.nix
    ./apps/alacritty.nix
    ./config/gnome.nix
#     ./config/fonts.nix
  ];

#   programs.zsh.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

      # tailscale
#       tailscale tailscale-systray

      # gui customization
#       ulauncher

      # gui apps
      # firefox
#       hardinfo
#       spotify

      # syncthing
#       syncthing syncthingtray

      # terminal apps
#       mc
      ncdu
#       ansible
#       ansible-lint
#       ventoy-full
#       htop
#       btop
      
      # terminal customization
#       alacritty
      neofetch
#       exa
#       bat

      # dev stuff
#       git
#       python311
#       vscode
#       terraform


  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/funk/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}


