{
    description = "the korff setup";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        darwin = {
            url = "github:lnl7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # In this context, outputs are mostly about getting home-manager what it
    # needs since it will be the one using the flake
    outputs = { nixpkgs, home-manager, darwin, ... }: {
        darwinConfigurations = {
            MKOMacOS = darwin.lib.darwinSystem {
                system = "aarch64-darwin";
                modules = [
                    ./machines/MKOMacOS
                    home-manager.darwinModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = false;
                        home-manager.users.mko = {
                            imports = [
                                ./home.nix
                            ];
                        };
                    }
                ];
            };
        };
        homeConfigurations = {
            "mko" = home-manager.lib.homeManagerConfiguration {
                # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
                pkgs = nixpkgs.legacyPackages.aarch64-darwin;
                modules = [ ./home.nix ];
            };
        };
    };
}
