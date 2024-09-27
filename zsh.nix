{ config, pkgs, ... }:

{
  # add zsh shell
  environment.shells = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

#     shellAliases = {
#       "ls" = "eza -alh --group-directories-first --time-style=long-iso --icons --git";
#       "nrs" = "sudo nixos-rebuild switch";
#     };
  };
}
