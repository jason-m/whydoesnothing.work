{ config, pkgs, ... }:

{
  users.users.nginx.extraGroups = [ "acme" ];
  services.nginx = {
    enable = true;
    virtualHosts."oc.whydoesnothing.work" = {
      useACMEHost = "oc.whydoesnothing.work";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9200";
        proxyWebsockets = true;

        # somewhat important proxy settings to make it not be poo 
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Forwarded-Host $host;
          proxy_set_header X-Forwarded-Port $server_port;
          
          proxy_connect_timeout 300s;
          proxy_send_timeout 300s;
          proxy_read_timeout 300s;
          client_max_body_size 10G;
          proxy_buffering off;
          proxy_request_buffering off;
        '';
        # end big block of raw nginx config pasted in
      };
    };
    
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
