{ config, pkgs, ... }:

{
  # Make sure to replace email and host values
  # if you are using another DNS provider adjust variables accordingly.

  security.acme = {
    acceptTerms = true;
    defaults.email ="user@<host>.<domain>";
    certs."<host>.<domain>" = {
      dnsProvider = "cloudflare";  # Set to your DNS provider
      environmentFile = "/etc/secrets/.cloudflare/dns_api.env"; # point to environment file container your API details
      dnsPropagationCheck = true;
    };
  };
}
