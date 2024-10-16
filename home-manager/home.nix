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
    ./apps/starship.nix
    ./apps/alacritty.nix
#     ./config/gnome.nix
    ./config/kde.nix
#     ./config/fonts.nix

    ./apps/dropbox.nix
  ];

#   programs.zsh.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

      librewolf               # more secure firefox
      bitwarden-desktop

      tldr                    # user friendly man page
      preload                 # Makes applications run faster by prefetching binaries and shared objects


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


