{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    (
      # Put the most recent revision here:
      let revision = "fd13986ede9b94c50e84aecb2c88863e297bbb52"; in
      builtins.fetchTarball {
        url = "https://github.com/Jovian-Experiments/Jovian-NixOS/archive/${revision}.tar.gz";
        # Update the hash as needed:
        sha256 = "sha256:0pi3awkvpkvczprvv4jflsiglfzrq4b1p7094ihijfj7gq6vzq2b";
      } + "/modules"
    )    
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-deck"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  jovian.devices.steamdeck.enable = true;
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  jovian.steam.user = "jason";
  jovian.steam.desktopSession = "plasmawayland";

  programs.xwayland.enable = true;
  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.groups.steamos.gid = 1000;

  users.users.jason = {
    isNormalUser = true;
    description = "jason";
    group = "steamos";     
    extraGroups = [ "networkmanager" "wheel" "users" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

  services.openssh.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}
