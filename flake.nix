{
  description = "NixOS configuration for Funk";

  inputs = {
    # NixOS official package source, here using the nixos-24.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
#       nixos = nixpkgs.lib.nixosSystem {
#         system = "x86_64-linux";
#         modules = [
#           ./configuration.nix
#           home-manager.nixosModules.home-manager
#           {
#             home-manager.useGlobalPkgs = true;
#             home-manager.useUserPackages = true;
#             home-manager.users.funk = import ./home-manager/home.nix;
#           }
#         ];
#       };

      ##############################################################################

      thinknix-t460 = let
        username = "funk";
        specialArgs = {inherit username;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/thinknix-t460
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }

          ];
        };

       ##############################################################################

    };
  };
}
