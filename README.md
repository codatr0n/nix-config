# My flake-y-fied NixOS configuration

Ready for multiple hosts

### How to rebuild:

`sudo nixos-rebuild switch --flake ~/nix-config/#[configuration name here]`

eg.

`sudo nixos-rebuild switch --flake ~/nix-config/#thinknix-t460`

### How to update packages

`nix flake update`

... then rebuild
