{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64_linux";
      #specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.canUserPkgs = true;

          home-manager.users.ralfd = import "./home.nix";
        }
      ];
    };
  };
}

