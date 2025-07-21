{
  description = "Nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self,  nixpkgs, home-manager, hyprland, ... }@inputs: {
    
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

          wayland.windowManager.hyprland = {
            enable = true;
           
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          };
        }
        
        # {
        #   wayland.windowManager.hyprland = {
        #     enable = true;
           
        #     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        #     portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        #   };
        # }
      ];
    };
  };
}

