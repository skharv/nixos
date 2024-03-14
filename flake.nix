{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let 
    system = "x86_64-linux";
    inherit (import ./config/options.nix) username hostname;

    pkgs = import nixpkgs {
      inherit system;
      config =  {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit hostname;
        };
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users."${username}" = import ./config/home.nix;
          }
        ];
      };
    };
  };
}
