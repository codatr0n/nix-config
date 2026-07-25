{pkgs, ...}: {
  ##################################################################################################################
  #
  # Funk's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs/common.nix
    ../../home/programs/browsers.nix
    ../../home/programs/zsh.nix
    ../../home/programs/alacritty.nix
    ../../home/programs/starship.nix
    ../../home/programs/dropbox.nix
    ../../home/config/fonts.nix
    ../../home/config/kde.nix

  ];

  programs.git = {
    settings.user = {
      name = "Erik MK";
      email = "mail@erikmk.dk";
    };
  };

}
