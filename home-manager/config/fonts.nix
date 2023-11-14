{ pkgs, ... }:

{
    fonts.fontconfig.enable = true;

    # GENERAL FONTS
    home.packages = with pkgs; [
        # fira-code
        # fira-code-symbols

        # FONTS WITH OVERRIDE
        (nerdfonts.override { 
            fonts = [
                "FiraCode" 
                "Hack"
                "Meslo"
                "Inconsolata"
                "Monoid"
            ];
        })
    ];

}