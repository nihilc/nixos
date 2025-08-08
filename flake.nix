{
  description = "nihilc's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-flatpak,
      ...
    }:
    {
      nixosConfigurations = {
        kronos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./host/kronos/configuration.nix
            ./modules/users.nix
            ./modules/software.nix
            ./modules/services.nix
            ./modules/hyprland.nix
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
      };
    };
}
