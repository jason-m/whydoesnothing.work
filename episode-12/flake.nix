{
  description = "words";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };
  outputs = { self, nixpkgs, nixos-hardware, ... }@inputs : {
    nixosConfigurations.SYSTEMNAME = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
      specialArgs = { inherit inputs; };
    };

  };
}
