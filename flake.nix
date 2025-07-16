{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; 
    home-manager = {
      url = "github:nix-community/home-manager"; #/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self,  nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix 
        home-manager.nixosModules.home-manager 
        {
          users.users.ralfd.isNormalUser = true;
	  users.users.ralfd.extraGroups = [ "wheel" ]
          #users.users.ralfd.initialPassword = "Cur<>ragh1";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.ralfd = import ./home.nix;
        }
      ];
    };
  };
}

