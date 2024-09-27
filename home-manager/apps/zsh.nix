  { pkgs, ...}:
  
  {
    home.packages = with pkgs; [ fzf ];

    home.shellAliases = {
          "ls" = "eza -alh --group-directories-first --time-style=long-iso --icons --git";
          "rebuild" = "sudo nixos-rebuild switch --flake ~/nix-config/#";
        };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history = {
          size = 10000;
          save = 10000;
          share = true;
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "docker-compose"
                "docker"
            ];
            theme = "jonathan";
            };
        initExtra = ''
          bindkey '^f' autosuggest-accept
        '';
    };
    # programs.zsh.plugins = [
    #     {
    #         name = "powerlever10k";
    #         src = pkgs.zsh-powerlevel10k;
    #         file = "share/zsh-powerleverk10k.zsh-theme";
    #     }
    # ];

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
  }
