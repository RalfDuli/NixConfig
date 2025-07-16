{
  description = "Nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self,  nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix 

        home-manager.nixosModules.home-manager 

        {
          users.users.ralfd = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ralfd = import ./home.nix;
          };
        }
      ];
    };
  };
}

