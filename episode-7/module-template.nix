{ config, lib, pkgs, ... }:

let
  cfg = config.services.app-name;   
  # cfg = config.programs.app-name;

  configFile = pkgs.writeText "app-name.conf" ''
    aSetting=${cfg.optionText}
    anotherSetting=${toString cfg.optionNumber}
  '';
in
{
  options.services.app-name = {
  # options.programs.app-name = {  
    enable = lib.mkEnableOption "app-name";

    # Link the module to a package
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.app-name;
      description = "A descriptin of the app or service ";
    };

    # Set options 
    optionText = lib.mkOption {
      type = lib.types.str;
      default = "words or whatever";
      description = "Description of what the option does";
    };

    optionNumber = lib.mkOption { 
      type = lib.types.int;
      default = 80085;
      description = "Description of what the option does";
    };
  };


  # Systemd Service
  config = lib.mkIf cfg.enable {
    systemd.services.app-name = { 
      description = "Describe your service"; 
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${cfg.package}/bin/app-name ${configFile}";
        Restart = "always";
      };
    };
  };



}
