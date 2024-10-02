  { pkgs, ...}:
  
  {
    programs.starship = {
      enable = true;

      presets = [
        "nerd-font-symbols"
        "bracketed-segments"
      ];
    };
  }
