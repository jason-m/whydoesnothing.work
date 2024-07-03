Switching Generations without reboot 
```
nix-env --list-generations -p /nix/var/nix/profiles/system
nix-env --switch-generation <number> -p /nix/var/nix/profiles/system
# sets selected generation to be activated 
/nix/var/nix/profiles/system/bin/switch-to-configuration { switch or boot }
```

## Set current config to default boot
use this when you boot a previous generation via the boot manager menu and want it to be set to default on next boot
`/run/current-system/bin/switch-to-configuration { switch or boot }`

