  { pkgs, ...}:
  
  {

    home.packages = with pkgs; [
		starship
	];

    programs.starship = {
      enable = true;

      enableZshIntegration = true;

#       settings = {
#         add_newline = true;
#         command_timeout = 1000;
#         format = "$username $hostname";
#         character = {
#           success_symbol = "[󰜃 ](bright-cyan)";
#           error_symbol = "[](red)";
#         };
#         username = {
#           style_user = "white bold";
#           style_root = "red bold";
#           format = "[$user]($style)";
#           disabled = false;
#           show_always = true;
#         };
#         hostname = {
#           ssh_only = false;
#           format = "@ [$hostname](bold yellow) ";
#           disabled = false;
#         };
#         directory = {
#           home_symbol = "󰋞 ~";
#           read_only_style = "197";
#           read_only = "  ";
#           format = "at [$path]($style)[$read_only]($read_only_style) ";
#         };
#         git_branch = {
#           symbol = " ";
#           format = "via [$symbol$branch]($style) ";
#           style = "bold green";
#         };
#         git_status = {
#           format = "[\($all_status$ahead_behind\)]($style) ";
#           style = "bold green";
#           conflicted = "🏳";
#           up_to_date = " ";
#           untracked = " ";
#           ahead = "⇡\${count}";
#           diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
#           behind = "⇣\${count}";
#           stashed = " ";
#           modified = " ";
#           staged = "[++\($count\)](green)";
#           renamed = "襁 ";
#           deleted = " ";
#         };
#       };

#       presets = [
#         "nerd-font-symbols"
#         "bracketed-segments"
#       ];
    };
  }
