{ config, pkgs, ... }:

{
services.ocis = {
    enable = true;
    environmentFile = "/etc/secrets/.owncloud/credentials.env";  # Load credentials from file
    environment = {
      # Basic configuration
      OCIS_URL = "https://<host>.<domain>";
      OCIS_LOG_LEVEL = "info";
      
      # Disable built-in TLS since we're using nginx locally and Cloudflare externally
      OCIS_INSECURE = "true";
      
      # Bind to localhost
      OCIS_BIND_ADDRESS = "127.0.0.1";
      OCIS_BIND_PORT = "9200";
      
      # Admin user (password comes from environmentFile)
      OCIS_ADMIN_USER_ID = "admin";
      OCIS_ADMIN_USER_UUID = "00000000-0000-0000-0000-000000000001";  # replace this with a proper uuid by using uuidgen
      # Trust proxy headers
      OCIS_PROXY_ENABLE_BASIC_AUTH = "false";
    };
  };
    
}