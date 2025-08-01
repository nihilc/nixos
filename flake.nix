{
  description = "nihilc's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      kronos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./host/kronos/configuration.nix
          ./modules/software.nix
          ./modules/services.nix
        ];
      };
    };
  };
}
