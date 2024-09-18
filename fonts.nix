{ config, pkgs, ... }:
{

  fonts.packages = with pkgs; [
    noto-fonts
    ubuntu_font_family
    noto-fonts-emoji
    liberation_ttf
    fira
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    mplus-outline-fonts.githubRelease
    dina-font
    jetbrains-mono

    (nerdfonts.override { fonts = [
      "JetBrainsMono"
    ];}
    )
  ];

}
