#!/usr/bin/env nix-shell
#! nix-shell -i bash -p openssl

# Generate self-signed certificate
mkdir -p /etc/nginx/ssl
chmod 644 /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx-selfsigned.key \
  -out /etc/nginx/ssl/nginx-selfsigned.crt \
  -subj "/C=CA/ST=Alberta/L=Edmonton/O=HomeServer/CN=localhost"

echo "Generated SSL certificate files:"
echo "- nginx-selfsigned.crt"
echo "- nginx-selfsigned.key"

# Set proper permissions
chmod 600 /etc/nginx/ssl/nginx-selfsigned.key
chmod 644 /etc/nginx/ssl/nginx-selfsigned.crt

echo "Permissions set correctly."
