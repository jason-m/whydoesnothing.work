{
  description = "Flakes overlay Template";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: {
    nixosConfigurations.demo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          nixpkgs = { overlays = [(self: super: { unstable = import nixpkgs-unstable { system = "x86_64-linux"; }; }) ]; };
        })
        ./configuration.nix
      ];
    };
  };
}