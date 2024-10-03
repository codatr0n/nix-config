{ config, pkgs, ... }:
{

  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    ubuntu_font_family
    noto-fonts-emoji
    liberation_ttf # replacements for Times New Roman, Arial, and Courier New
    corefonts # microsoft fonts
    gelasio # font which is metric-compatible with Microsoft's Georgia

    # developers fonts
    dina-font
    fira
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    jetbrains-mono
    julia-mono

    (nerdfonts.override { fonts = [
          "JetBrainsMono"
          "Iosevka"
          "Hack"
          "Meslo"
          "Terminus"
          "Monoid"
          "Inconsolata"

        ];
      }
    )
  ];

}
