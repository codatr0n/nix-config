{
  pkgs,
  ...
}:
# nix tooling
{
  home.packages = with pkgs; [
    tldr

  ];

  # programs.direnv = {
  #   enable = true;
  #   nix-direnv.enable = true;
  #   enableZshIntegration = true;
  #};
}
