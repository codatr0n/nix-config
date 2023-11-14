  { pkgs, ...}:
  
  {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        shellAliases = {
            ls = "exa -alh --time-style=long-iso --icons --git";
            
            hs = "home-manager switch";
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