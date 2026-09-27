{
  description = "the korff setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = { nixpkgs, noctalia, noctalia-greeter, home-manager, ... } @ inputs:
  {
    nixosConfigurations = {
      black-01 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostname = "black-01";
          username = "korff";
          envsetupRoot = ./..;
          inherit inputs;
        };
        modules = [
          home-manager.nixosModules.home-manager
          noctalia.nixosModules.default
          noctalia-greeter.nixosModules.default
          ./machines/black-01
        ];
      };
      mko-lnx-01 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostname = "mko-lnx-01";
          username = "mko";
          envsetupRoot = ./..;
          inherit inputs;
        };
        modules = [
          home-manager.nixosModules.home-manager
          noctalia.nixosModules.default
          noctalia-greeter.nixosModules.default
          ./machines/mko-lnx-01
        ];
      };
    };
  };
}
