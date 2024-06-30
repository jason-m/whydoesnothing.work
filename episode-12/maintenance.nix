{ config, pkgs, inputs,  ... }:

{

  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
  };


}
