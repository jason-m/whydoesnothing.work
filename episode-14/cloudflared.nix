{ config, pkgs, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "<TUNNEL ID>" = {
        credentialsFile = "/etc/secrets/.cloudflare/<TUNNEL ID>.json";
        default = "http_status:404";
        ingress = {
          "<host>.<domain>" = "http://127.0.0.1:9200";    # Direct to OCIS
        };
      };
    };
  };
}
