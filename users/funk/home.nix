{pkgs, ...}: {
  ##################################################################################################################
  #
  # Funk's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../zsh.nix
    ../../alacritty.nix
    ../../starship.nix
    ../../dropbox.nix

  ];

  programs.git = {
    userName = "Erik MK";
    userEmail = "mail@erikmk.dk";
  };

}
