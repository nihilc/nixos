{
  description = "nihilc's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-flatpak,
      quickshell,
      ...
    }:
    {
      nixosConfigurations = {
        kronos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit quickshell; };
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
