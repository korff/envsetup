{
  description = "the korff setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    noctalia.url = "github:noctalia-dev/noctalia";
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = { nixpkgs, noctalia, ... } @ inputs:
  {
    nixosConfigurations = {
      mko-lnx-01 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostname = "mko-lnx-01";
          username = "mko";
          envsetupRoot = ./..;
          inherit inputs;
        };
        modules = [
          noctalia.nixosModules.default
          ./machines/mko-lnx-01
        ];
      };
    };
  };
}
