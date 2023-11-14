{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {

      window = {
        title = "Terminal";

        padding = { 
            y = 10;
            x = 10;
        };

        dimensions = {
          columns = 120;
          lines = 40;
        };

        decorations = "Full";

        decorations_theme_variant = "Dark";
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Always";
        };
        blink_interval = 500;
      };

      font = {
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        size = 10.0;
        style = "Bold";
        offset = {
            x = 0;
            y = 0;
        };
      };

      window.opacity = 0.95;

      shell = { 
        program = "${pkgs.zsh}/bin/zsh"; 
        # args = ["-e" "echo; neofetch; echo" ];
      };

      live_config_reload = true;

      # Snazzy color theme
      colors = {
        primary = {
          background = "0x"+"282a36";
          foreground = "0x"+"eff0eb";
        };
        cursor = {
          # text = "0x"+"0xFF261E";
          cursor = "0x"+"97979b";
        };
        selection = {
          text = "0x"+"282a36";
          background = "0x"+"feffff";
        };
        normal = {
          black = "0x"+"282a36";
          red = "0x"+"ff5c57";
          green = "0x"+"5af78e";
          yellow = "0x"+"f3f99d";
          blue = "0x"+"57c7ff";
          magenta = "0x"+"ff6ac1";
          cyan = "0x"+"9aedfe";
          white = "0x"+"f1f1f0";
        };
        bright = {
          black = "0x"+"686868";
          red = "0x"+"ff5c57";
          green = "0x"+"5af78e";
          yellow = "0x"+"f3f99d";
          blue = "0x"+"57c7ff";
          magenta = "0x"+"ff6ac1";
          cyan = "0x"+"9aedfe";
          white = "0x"+"eff0eb";
        };
      };
    };
  };
}
