{pkgs, ...}: {
  ##################################################################################################################
  #
  # Funk's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs/zsh.nix
    ../../home/programs/alacritty.nix
    ../../home/programs/starship.nix
    ../../home/programs/dropbox.nix

  ];

  programs.git = {
    userName = "Erik MK";
    userEmail = "mail@erikmk.dk";
  };

}
