  GNU nano 7.2                                                   flake.nix                                                             
{
  description = "Base system for raspberry pi 4";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators, ... }:
  {
    nixosModules = {
      system = {
        disabledModules = [
          "profiles/base.nix"
        ];

        system.stateVersion = "23.11";
      };  
      users = {
        users.users = {
          admin = {
            password = "admin123";
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
        };
      };  
    };  

    packages.aarch64-linux = {
      sdcard = nixos-generators.nixosGenerate {
        system = "aarch64-linux";
        format = "sd-aarch64";
        modules = [
          ./extra-config.nix
          self.nixosModules.system
          self.nixosModules.users
        ];
      };
    };
  };
}

