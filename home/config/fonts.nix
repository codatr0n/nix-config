{ pkgs, ... }:

{
    home.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.hack
        nerd-fonts.meslo-lg
        nerd-fonts.inconsolata
        nerd-fonts.monoid
    ];

}
