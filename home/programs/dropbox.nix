  { pkgs, ...}:
  
  {

    home.packages = with pkgs; [
		maestral        # open source dropbox client
		maestral-gui
	];

  }
