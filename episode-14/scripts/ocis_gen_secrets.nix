#!/usr/bin/env nix-shell
#! nix-shell -i bash -p openssl

echo
echo "OCIS_JWT_SECRET=$(openssl rand -base64 48 | tr -d '=+/' | cut -c1-64)"
echo "OCIS_MACHINE_AUTH_API_KEY=$(openssl rand -base64 36 | tr -d '=+/' | cut -c1-48)"
echo "OCIS_ADMIN_USER_PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 24)"
echo "OCIS_TRANSFER_SECRET=$(openssl rand -base64 48 | tr -d '=+/' | cut -c1-64)"