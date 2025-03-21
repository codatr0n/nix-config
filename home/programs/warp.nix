  { pkgs, ...}:
  
  {

    home.packages = with pkgs; [
      warp-terminal
    ];

#     home.file = {
#       ".config/starship.toml" = {
#         source = ../config/starship.toml;
#         recursive = true;
#       };
#     }

  }
